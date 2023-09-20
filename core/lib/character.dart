class Character {
  int code = 'A'.codeUnitAt(0);

  String get value => String.fromCharCode(code);

  Object toJson() => code;

  static Character fromJson(Object? value) {
    final character = Character();

    if (value case int code) {
      character.code = code;
    }

    return character;
  }

  @override
  operator ==(other) => other is Character && code == other.code;

  @override
  int get hashCode => code.hashCode;
}
