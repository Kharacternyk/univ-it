import 'dart:convert';
import 'dart:io';

import 'package:core/character_interval.dart';
import 'package:core/column.dart';
import 'package:core/database.dart';
import 'package:core/table.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'column_request.dart';
import 'database_request.dart';
import 'table_request.dart';
import 'url_string.dart';

class Server {
  final router = Router();

  Server({
    required String databasesSlug,
    required String tablesSlug,
    required String columnsSlug,
    required String rowsSlug,
    required String cellsSlug,
  }) {
    final databasesUrl = databasesSlug.url(0);
    final tablesUrl = databasesUrl + tablesSlug.url(1);
    final columnsUrl = tablesUrl + columnsSlug.url(2);
    final rowsUrl = tablesUrl + rowsSlug.url(2);
    final columnCellsUrl = columnsUrl + cellsSlug.url(3);
    final rowCellsUrl = rowsUrl + cellsSlug.url(3);

    router.put(databasesUrl, (_, String name) async {
      await File(name).writeAsString(jsonEncode(Database()));

      return Response.ok(null);
    });

    router.get(databasesUrl, (_, String name) async {
      try {
        return Response.ok(await File(name).readAsString());
      } on FileSystemException {
        return Response.notFound(null);
      }
    });

    router.post(databasesUrl, (Request request, String name) async {
      final bodyString = await request.readAsString();
      final Object? bodyJson;

      try {
        bodyJson = jsonDecode(bodyString);
      } on FormatException {
        return Response.badRequest();
      }

      if (bodyJson case {'name': String newName}) {
        try {
          await File(name).rename(newName);
        } on FileSystemException {
          return Response.notFound(null);
        }

        return Response.ok(null);
      }

      return Response.badRequest();
    });

    router.delete(databasesUrl, (_, String name) async {
      try {
        await File(name).delete();
      } on FileSystemException {
        return Response.notFound(null);
      }

      return Response.ok(null);
    });

    router.put(databasesUrl + UrlString.separator + tablesSlug, (
      Request request,
      String databaseName,
    ) {
      return request.withDatabase(databaseName, (database, _) async {
        database.tables.add(Table());

        return Response.ok(jsonEncode({'index': database.tables.length - 1}));
      });
    });

    router.get(tablesUrl, (
      Request request,
      String databaseName,
      String tableIndex,
    ) {
      return request.withTable(databaseName, tableIndex, (table, _) async {
        return Response.ok(jsonEncode(table));
      });
    });

    router.post(tablesUrl, (
      Request request,
      String databaseName,
      String tableIndex,
    ) async {
      return request.withDatabase(databaseName, (database, body) async {
        switch (body) {
          case {'name': String newName}:
            if (int.tryParse(tableIndex) case int i
                when i < database.tables.length) {
              database.tables[i].name = newName;
              return Response.ok(null);
            }

            return Response.notFound(null);

          case {'removeFrom': int j}:
            if (int.tryParse(tableIndex) case int i
                when i < database.tables.length && j < database.tables.length) {
              database.tables[i].removeFrom(database.tables[j]);
              return Response.ok(null);
            }

            return Response.notFound(null);

          default:
            return Response.badRequest();
        }
      });
    });

    router.delete(tablesUrl, (
      Request request,
      String databaseName,
      String tableIndex,
    ) async {
      return request.withDatabase(databaseName, (database, _) async {
        if (int.tryParse(tableIndex) case int i
            when i < database.tables.length) {
          database.tables.removeAt(i);

          return Response.ok(null);
        }

        return Response.notFound(null);
      });
    });

    router.put(tablesUrl + UrlString.separator + columnsSlug, (
      Request request,
      String databaseName,
      String tableIndex,
    ) {
      return request.withTable(databaseName, tableIndex, (table, body) async {
        final columns = table.columns;

        if (body case {'type': String columnType}) {
          switch (columnType.toLowerCase()) {
            case 'i':
              columns.add(IntegerColumn());
            case 'r':
              columns.add(RealColumn());
            case 'c':
              columns.add(CharacterColumn());
            case 's':
              columns.add(StringColumn());
            case 'ci':
              columns.add(CharacterIntervalColumn());
            case 'cis':
              columns.add(CharacterIntervalStringColumn());
            default:
              return Response.badRequest();
          }
        } else {
          return Response.badRequest();
        }

        for (var i = 0; i < table.columns.first.cells.length; ++i) {
          table.columns.last.addDefault();
        }

        return Response.ok(jsonEncode({'index': columns.length - 1}));
      });
    });

    router.get(columnsUrl, (
      Request request,
      String databaseName,
      String tableIndex,
      String columnIndex,
    ) {
      return request.withColumn(
        databaseName,
        tableIndex,
        columnIndex,
        (column, _) async {
          return Response.ok(jsonEncode(column));
        },
      );
    });

    router.post(columnsUrl, (
      Request request,
      String databaseName,
      String tableIndex,
      String columnIndex,
    ) {
      return request.withColumn(
        databaseName,
        tableIndex,
        columnIndex,
        (column, body) async {
          if (body case {'name': String newName}) {
            column.name = newName;
            return Response.ok(null);
          }

          return Response.badRequest();
        },
      );
    });

    router.delete(columnsUrl, (
      Request request,
      String databaseName,
      String tableIndex,
      String columnIndex,
    ) {
      return request.withTable(
        databaseName,
        tableIndex,
        (table, body) async {
          if (int.tryParse(columnIndex) case int i
              when i < table.columns.length) {
            table.columns.removeAt(i);

            return Response.ok(null);
          }

          return Response.notFound(null);
        },
      );
    });

    router.put(tablesUrl + UrlString.separator + rowsSlug, (
      Request request,
      String databaseName,
      String tableIndex,
    ) {
      return request.withTable(
        databaseName,
        tableIndex,
        (table, _) async {
          for (final column in table.columns) {
            column.addDefault();
          }

          return Response.ok(jsonEncode({
            'index': (table.columns.firstOrNull?.cells.length ?? 1) - 1,
          }));
        },
      );
    });

    for (final url in [columnCellsUrl, rowCellsUrl]) {
      router.get(url, (
        Request request,
        String databaseName,
        String tableIndex,
        String primaryIndex,
        String secondaryIndex,
      ) {
        final (columnIndex, cellIndex) = url == columnCellsUrl
            ? (primaryIndex, secondaryIndex)
            : (secondaryIndex, primaryIndex);

        return request.withColumn(
          databaseName,
          tableIndex,
          columnIndex,
          (column, _) async {
            if (int.tryParse(cellIndex) case int i
                when i < column.cells.length) {
              return Response.ok(jsonEncode(column.cells[i]));
            }

            return Response.notFound(null);
          },
        );
      });

      router.post(url, (
        Request request,
        String databaseName,
        String tableIndex,
        String primaryIndex,
        String secondaryIndex,
      ) {
        final (columnIndex, cellIndex) = url == columnCellsUrl
            ? (primaryIndex, secondaryIndex)
            : (secondaryIndex, primaryIndex);

        return request.withColumn(
          databaseName,
          tableIndex,
          columnIndex,
          (column, body) async {
            if (int.tryParse(cellIndex) case int i
                when i < column.cells.length) {
              switch ((column, body)) {
                case (IntegerColumn column, int value):
                  column.cells[i] = value;
                case (RealColumn column, double value):
                  column.cells[i] = value;
                case (CharacterColumn column, int code):
                  column.cells[i].code = code;
                case (StringColumn column, String value):
                  column.cells[i] = value;
                case (CharacterIntervalColumn column, [int start, int end]):
                  column.cells[i].start.code = start;
                  column.cells[i].end.code = end;
                case (
                    CharacterIntervalStringColumn column,
                    List<Object> values
                  ):
                  column.cells[i].intervals =
                      values.map(CharacterInterval.fromJson).toList();
                default:
                  return Response.badRequest();
              }

              return Response.ok(null);
            }

            return Response.notFound(null);
          },
        );
      });
    }
  }
}
