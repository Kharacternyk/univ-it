extension UrlString on String {
  String url(int index) {
    return ([
      separator,
      this,
      separator,
      patternStart,
      index,
      patternEnd,
    ]).join();
  }

  static const String separator = '/';
  static const String patternStart = '<';
  static const String patternEnd = '>';
}
