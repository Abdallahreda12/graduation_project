import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Language
  static const _keyLang = 'language_code';

  static Future<void> setLanguage(String langCode) async {
    await _prefs?.setString(_keyLang, langCode);
  }

  static String? getLanguage() {
    return _prefs?.getString(_keyLang);
  }

  // Theme
  // in app_preferences.dart
  static const _keyTheme = 'app_theme';

  static Future<void> setTheme(String themeMode) async {
    await _prefs?.setString(_keyTheme, themeMode);
  }

  static String? getTheme() {
    return _prefs?.getString(_keyTheme);
  }

  // Add more preference getters/setters here...
}
