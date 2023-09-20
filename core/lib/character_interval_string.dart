import 'character_interval.dart';

class CharacterIntervalString {
  var intervals = <CharacterInterval>[];

  Object toJson() => intervals;

  static CharacterIntervalString fromJson(Object? value) {
    final string = CharacterIntervalString();

    if (value case List<Object?> intervals) {
      string.intervals.addAll(intervals.map(CharacterInterval.fromJson));
    }

    return string;
  }

  @override
  operator ==(Object other) {
    if (other case CharacterIntervalString other) {
      if (intervals.length != other.intervals.length) {
        return false;
      }

      for (var i = 0; i < intervals.length; ++i) {
        if (intervals[i] != other.intervals[i]) {
          return false;
        }
      }

      return true;
    }

    return false;
  }

  @override
  int get hashCode => Object.hashAll(intervals);
}
