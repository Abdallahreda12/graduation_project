import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static final locales = [
    Locale('en'),
    Locale('ar'),
  ];

  static const fallbackLocale = Locale('en');

  static Future<Map<String, Map<String, String>>> loadTranslations() async {
    Map<String, Map<String, String>> translations = {};

    for (var locale in locales) {
      final jsonString = await rootBundle
          .loadString('assets/lang/${locale.languageCode}.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      translations[locale.languageCode] =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));
    }

    return translations;
  }

  static Locale getLocaleFromLanguage(String langCode) {
    return locales.firstWhere((locale) => locale.languageCode == langCode,
        orElse: () => fallbackLocale);
  }

  final Map<String, Map<String, String>> _loadedKeys;

  TranslationService(this._loadedKeys);

  @override
  Map<String, Map<String, String>> get keys => _loadedKeys;
}

// chang lang by getx is done, just put the words in the en.json and ar.json files
