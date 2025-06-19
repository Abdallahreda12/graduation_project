import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MylocaleController extends GetxController {
  var currentLocale = const Locale('en').obs;

//save lang by sharepref, used it in 'changeLang' fun 
  void saveLanguage(String langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', langCode);
  }
//get seved lang by sharepref, used it in 'initLang' fun 
  Future<String?> getSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('language_code'); // returns null if not found
  }

//the main fun, i used it when change lang to update sharepref and change lang in my app
  void changLang(String langCode) {
    Locale locale = Locale(langCode);
    saveLanguage(langCode);
    Get.updateLocale(locale);
  }

//use it in main.dart to get initlang that i saved it by shared\pref
  Future<void> initLang() async {
    final savedLangCode = await getSavedLanguage();
    Locale initlang = Locale(savedLangCode == 'en' ? 'en' : 'ar');
    currentLocale.value = initlang;
    Get.updateLocale(initlang);
  }
}
