import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin ThemeMixin {
  void changeTheme([ThemeMode? theme]) {
    if (theme != null) {
      Get.changeThemeMode(theme);
    } else {
      if (Get.isDarkMode)
        Get.changeThemeMode(ThemeMode.light);
      else
        Get.changeThemeMode(ThemeMode.dark);
    }
  }
}
