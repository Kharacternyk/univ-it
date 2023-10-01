import 'package:http_server/server.dart';
import 'package:shelf/shelf_io.dart';

void main() async {
  final server = Server(
    databasesSlug: 'databases',
    tablesSlug: 'tables',
    columnsSlug: 'columns',
    rowsSlug: 'rows',
    cellsSlug: 'cells',
  );

  await serve(server.router, 'localhost', 8123);
}
