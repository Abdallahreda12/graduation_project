import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/util/appPreference.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  @override
  void onInit() async {
    loadTheme();
    super.onInit();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    final mode = isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
    AppPreferences.setTheme(isDarkMode.value ? 'dark' : 'light');
    Get.changeThemeMode(mode);
  }

  void loadTheme() {
    final theme = AppPreferences.getTheme() ?? 'light';
    isDarkMode.value = theme == 'dark';
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
