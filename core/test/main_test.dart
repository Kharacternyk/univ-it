import 'dart:convert';

import 'package:core/character.dart';
import 'package:core/character_interval.dart';
import 'package:core/character_interval_string.dart';
import 'package:core/column.dart';
import 'package:core/database.dart';
import 'package:core/table.dart';
import 'package:test/test.dart';

void main() {
  test('An instance of Database can be serialized and deserialized back', () {
    final database = Database()
      ..tables.add(Table()
        ..name = 'a table'
        ..columns.add(IntegerColumn()
          ..name = 'int'
          ..cells.add(1)
          ..cells.add(-42))
        ..columns.add(CharacterColumn()
          ..name = 'char'
          ..cells.add(Character()..code = 42)
          ..cells.add(Character()..code = 60))
        ..columns.add(StringColumn()
          ..name = 'str'
          ..cells.add('abc')
          ..cells.add('!@#"')))
      ..tables.add(Table()
        ..name = 'another table'
        ..columns.add(CharacterIntervalStringColumn()
          ..cells.add(CharacterIntervalString()
            ..intervals.add(CharacterInterval()
              ..start = (Character()..code = 100)
              ..end = (Character()..code = 102)))));
    final databaseCopy = Database.fromJson(jsonDecode(jsonEncode(database)));

    expect(databaseCopy, isNot(database));
    expect(databaseCopy.tables, hasLength(database.tables.length));

    for (var tableIndex = 0;
        tableIndex < database.tables.length;
        ++tableIndex) {
      for (var columnIndex = 0;
          columnIndex < database.tables[tableIndex].columns.length;
          ++columnIndex) {
        expect(
          databaseCopy.tables[tableIndex].columns[columnIndex].cells,
          pairwiseCompare(
            database.tables[tableIndex].columns[columnIndex].cells,
            (first, second) => first == second,
            'cells are equal',
          ),
        );
      }
    }
  });

  test('Table difference works properly', () {
    final firstTable = Table()
      ..columns.add(IntegerColumn()
        ..cells.add(1)
        ..cells.add(1)
        ..cells.add(2)
        ..cells.add(3))
      ..columns.add(StringColumn()
        ..cells.add('abc')
        ..cells.add('abc')
        ..cells.add('')
        ..cells.add(''))
      ..columns.add(RealColumn()
        ..cells.add(.1)
        ..cells.add(.1)
        ..cells.add(.2)
        ..cells.add(.2));
    final secondTable = Table()
      ..columns.add(IntegerColumn()
        ..cells.add(3)
        ..cells.add(2)
        ..cells.add(1))
      ..columns.add(StringColumn()
        ..cells.add('')
        ..cells.add('')
        ..cells.add('abc'))
      ..columns.add(RealColumn()
        ..cells.add(.2)
        ..cells.add(.1)
        ..cells.add(.1));

    firstTable.removeFrom(secondTable);
    expect(firstTable.columns, hasLength(3));
    expect(firstTable.columns.first.cells, hasLength(1));
    expect(firstTable.columns.first.cells.first, 2);
  });

  test('Instances of CharacterIntervalString are compared by value', () {
    CharacterIntervalString factory() {
      return CharacterIntervalString()
        ..intervals.add(CharacterInterval()..start = (Character()..code = 42))
        ..intervals.add(CharacterInterval()..end = (Character()..code = 100));
    }

    final first = factory();
    final second = factory();
    final third = CharacterIntervalString()
      ..intervals.add(CharacterInterval()..start = (Character()..code = 42))
      ..intervals.add(CharacterInterval()..end = (Character()..code = 100))
      ..intervals.add(CharacterInterval()..end = (Character()..code = 100));
    final fourth = CharacterIntervalString()
      ..intervals.add(CharacterInterval())
      ..intervals.add(CharacterInterval());

    expect(first, second);
    expect(first, isNot(third));
    expect(first, isNot(fourth));
  });
}
