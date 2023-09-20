import 'character.dart';
import 'character_interval.dart';
import 'character_interval_string.dart';

sealed class Column<T> {
  String name = 'New Column';
  final cells = <T>[];

  String get _typeCode;

  Object toJson() {
    return {
      'type': _typeCode,
      'name': name,
      'cells': cells,
    };
  }

  T _createDefault();

  void addDefault() {
    cells.add(_createDefault());
  }

  static Column<Object> fromJson(Object? value) {
    if (value
        case {
          'type': String typeCode,
          'name': String name,
          'cells': List<Object?> cells,
        }) {
      return IntegerColumn()._parse(typeCode, name, cells) ??
          RealColumn()._parse(typeCode, name, cells) ??
          CharacterColumn()._parse(typeCode, name, cells) ??
          StringColumn()._parse(typeCode, name, cells) ??
          CharacterIntervalColumn()._parse(typeCode, name, cells) ??
          CharacterIntervalStringColumn()._parse(typeCode, name, cells) ??
          IntegerColumn();
    }
    return IntegerColumn();
  }

  Column<T>? _parse(String typeCode, String name, List<Object?> cells) {
    if (_typeCode == typeCode) {
      this.name = name;

      for (final value in cells) {
        final cell = _parseCell(value);

        if (cell != null) {
          this.cells.add(cell);
        }
      }

      return this;
    }
    return null;
  }

  T? _parseCell(Object? cell) {
    if (cell case T cell) {
      return cell;
    }
    return null;
  }
}

class IntegerColumn extends Column<int> {
  @override
  final _typeCode = 'i';

  @override
  _createDefault() => 0;
}

class RealColumn extends Column<double> {
  @override
  final _typeCode = 'r';

  @override
  _createDefault() => 0;
}

class CharacterColumn extends Column<Character> {
  @override
  final _typeCode = 'c';

  @override
  Character? _parseCell(Object? cell) {
    return Character.fromJson(cell);
  }

  @override
  _createDefault() => Character();
}

class StringColumn extends Column<String> {
  @override
  final _typeCode = 's';

  @override
  _createDefault() => '';
}

class CharacterIntervalColumn extends Column<CharacterInterval> {
  @override
  final _typeCode = 'ci';

  @override
  CharacterInterval? _parseCell(Object? cell) {
    return CharacterInterval.fromJson(cell);
  }

  @override
  _createDefault() => CharacterInterval();
}

class CharacterIntervalStringColumn extends Column<CharacterIntervalString> {
  @override
  final _typeCode = 'cis';

  @override
  CharacterIntervalString? _parseCell(Object? cell) {
    return CharacterIntervalString.fromJson(cell);
  }

  @override
  _createDefault() => CharacterIntervalString();
}
