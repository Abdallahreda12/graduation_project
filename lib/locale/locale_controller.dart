import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/appPreference.dart';

class MylocaleController extends GetxController {
  var currentLocale = const Locale('en').obs;

  void changLang(String langCode) {
    Locale locale = Locale(langCode);
    AppPreferences.setLanguage(langCode);
    Get.updateLocale(locale);
  }

  Future<void> initLang() async {
    final savedLangCode = AppPreferences.getLanguage() ?? 'en';
    Locale initLang = Locale(savedLangCode);
    currentLocale.value = initLang;
    Get.updateLocale(initLang);
  }

  Future<String?> getSavedLanguage() async {
    return AppPreferences.getLanguage(); // already handles nulls
  }
}
