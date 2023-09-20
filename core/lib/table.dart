import 'column.dart';
import 'row.dart';

class Table {
  String name = 'New Table';
  final columns = <Column<Object>>[];

  void removeFrom(Table other) {
    if (columns.isEmpty || columns.length != other.columns.length) {
      return;
    }

    final otherRows = <Row>{};
    final otherRowCount = other.columns.first.cells.length;

    for (var rowIndex = 0; rowIndex < otherRowCount; ++rowIndex) {
      final cells = <Object>[];

      for (var columnIndex = 0; columnIndex < columns.length; ++columnIndex) {
        cells.add(other.columns[columnIndex].cells[rowIndex]);
      }

      otherRows.add(Row(cells));
    }

    for (var rowIndex = 0; rowIndex < columns.first.cells.length; ++rowIndex) {
      final cells = <Object>[];

      for (var columnIndex = 0; columnIndex < columns.length; ++columnIndex) {
        cells.add(columns[columnIndex].cells[rowIndex]);
      }

      if (otherRows.contains(Row(cells))) {
        for (var columnIndex = 0; columnIndex < columns.length; ++columnIndex) {
          columns[columnIndex].cells.removeAt(rowIndex);
        }

        --rowIndex;
      }
    }
  }

  Object toJson() {
    return {
      'name': name,
      'columns': columns,
    };
  }

  static Table fromJson(Object? value) {
    final table = Table();

    if (value case {'name': String name, 'columns': List<Object?> columns}) {
      table.name = name;
      table.columns.addAll(columns.map(Column.fromJson));
    }

    return table;
  }
}
