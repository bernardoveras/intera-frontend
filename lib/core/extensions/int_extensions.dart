import 'package:flutter/material.dart';

extension IntExtensions on int {
  ThemeMode get toThemeMode {
    switch (this) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
