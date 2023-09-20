import 'character.dart';

class CharacterInterval {
  var start = Character();
  var end = Character();

  Object toJson() => [start, end];

  static CharacterInterval fromJson(Object? value) {
    final interval = CharacterInterval();

    if (value case [Object? start, Object? end]) {
      interval.start = Character.fromJson(start);
      interval.end = Character.fromJson(end);
    }

    return interval;
  }

  @override
  operator ==(other) =>
      other is CharacterInterval && start == other.start && end == other.end;

  @override
  int get hashCode => Object.hash(start, end);
}
