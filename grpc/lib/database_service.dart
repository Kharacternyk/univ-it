import 'dart:convert';
import 'dart:io';

import 'package:core/column.dart' as core_column;
import 'package:core/database.dart' as core_database;
import 'package:core/table.dart' as core_table;

import 'generated/protos/database.pbgrpc.dart';

class DatabaseService extends DatabaseServiceBase {
  @override
  downloadDatabase(call, request) async {
    final database = await _getDatabase(request.name);

    return Database(
      tables: [
        for (final table in database.tables)
          Table(
            name: table.name,
            columns: [
              for (final column in table.columns)
                switch (column) {
                  core_column.IntegerColumn column => Column(
                      name: column.name,
                      type: ColumnType.integerColumn,
                      cells: [
                        for (final cell in column.cells)
                          Cell(integerValue: cell)
                      ],
                    ),
                  core_column.StringColumn column => Column(
                      name: column.name,
                      type: ColumnType.stringColumn,
                      cells: [
                        for (final cell in column.cells) Cell(stringValue: cell)
                      ],
                    ),
                  core_column.Column<Object?> column => Column(
                      name: column.name,
                      type: ColumnType.integerColumn,
                      cells: [
                        for (final _ in column.cells) Cell(integerValue: 0)
                      ],
                    ),
                },
            ],
          )
      ],
    );
  }

  @override
  deleteDatabase(call, request) async {
    await File(request.name).delete();
    return Void();
  }

  @override
  uploadDatabase(call, request) async {
    final database = core_database.Database();

    for (final table in request.database.tables) {
      final coreTable = core_table.Table();

      coreTable.name = table.name;

      for (final column in table.columns) {
        final coreColumn = switch (column.type) {
          ColumnType.stringColumn => core_column.StringColumn(),
          _ => core_column.IntegerColumn(),
        } as core_column.Column<Object>;

        coreColumn.name = column.name;

        for (final cell in column.cells) {
          switch (coreColumn) {
            case core_column.IntegerColumn column:
              column.cells.add(cell.integerValue);
            case core_column.StringColumn column:
              column.cells.add(cell.stringValue);
            default:
          }
        }

        coreTable.columns.add(coreColumn);
      }

      database.tables.add(coreTable);
    }

    return _writeDatabase(request.name, database);
  }

  @override
  diffTables(call, request) async {
    final database = await _getDatabase(request.database.name);

    database.tables[request.leftTableIndex]
        .removeFrom(database.tables[request.rightTableIndex]);

    return _writeDatabase(request.database.name, database);
  }

  Future<core_database.Database> _getDatabase(String name) async {
    try {
      final string = await File(name).readAsString();
      final json = jsonDecode(string);
      final database = core_database.Database.fromJson(json);

      return database;
    } on Exception {
      return core_database.Database();
    }
  }

  Future<Void> _writeDatabase(
      String name, core_database.Database database) async {
    await File(name).writeAsString(jsonEncode(database));
    return Void();
  }
}
