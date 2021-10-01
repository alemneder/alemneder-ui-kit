import 'dart:ui';

class LanguageManager {
  static LanguageManager? _instance;
  static LanguageManager? get instance {
    if (_instance == null) _instance = LanguageManager._init();
    return _instance;
  }

  LanguageManager._init();

  final enLocale = Locale('en', 'US');

  List<Locale> get supportLocales => [enLocale];
}
