import 'package:core/column.dart';
import 'package:shelf/shelf.dart';

import 'table_request.dart';

extension ColumnRequest on Request {
  Future<Response> withColumn(
    String databaseName,
    String tableIndex,
    String columnIndex,
    Future<Response> Function(Column<Object> column, Object? body) callback,
  ) async {
    return withTable(databaseName, tableIndex, (table, body) async {
      if (int.tryParse(columnIndex) case int i when i < table.columns.length) {
        return callback(table.columns[i], body);
      }

      return Response.notFound(null);
    });
  }
}
