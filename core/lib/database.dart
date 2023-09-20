import 'table.dart';

class Database {
  final tables = <Table>[];

  Object toJson() => tables;

  static Database fromJson(Object? value) {
    final database = Database();

    if (value is List<Object?>) {
      database.tables.addAll(value.map(Table.fromJson));
    }

    return database;
  }
}
