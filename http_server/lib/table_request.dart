import 'package:core/table.dart';
import 'package:shelf/shelf.dart';

import 'database_request.dart';

extension TableRequest on Request {
  Future<Response> withTable(
    String databaseName,
    String tableIndex,
    Future<Response> Function(Table table, Object? body) callback,
  ) async {
    return withDatabase(databaseName, (database, body) async {
      if (int.tryParse(tableIndex) case int i when i < database.tables.length) {
        return callback(database.tables[i], body);
      }

      return Response.notFound(null);
    });
  }
}
