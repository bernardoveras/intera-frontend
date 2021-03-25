import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/shared/settings.dart';
import '../../domain/services/local_storage_service.dart';

mixin ThemeMixin {
  void changeTheme([ThemeMode? theme]) {
    if (theme != null) {
      Get.changeThemeMode(theme);
      Settings.theme = theme;
    } else {
      if (Get.isDarkMode) {
        Get.changeThemeMode(ThemeMode.light);
        Settings.theme = ThemeMode.light;
      } else {
        Get.changeThemeMode(ThemeMode.dark);
        Settings.theme = ThemeMode.dark;
      }
    }
    ILocalStorage storage = Get.find();
    storage.add('theme', Settings.theme.index.toString());
  }

}
