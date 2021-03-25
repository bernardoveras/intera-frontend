import 'package:flutter/material.dart';
import 'shared/extensions/int_extensions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intera/shared/settings.dart';
import 'package:intera/shared/theme/theme.dart';

import 'data/services/local_storage_service.dart';
import 'domain/services/local_storage_service.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _startLocalStorage();
      _startTheme();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static void _startTheme() async {
    ILocalStorage storage = Get.find();

    int? theme = int.tryParse(await storage.get('theme') ?? 'null');

    if (theme != null) {
      Settings.theme = theme.toThemeMode;
    }

    Settings.theme == ThemeMode.light
        ? AppTheme.changeStatusBar<Dark>()
        : AppTheme.changeStatusBar<Light>();
  }

  static Future<void> _startLocalStorage() async {
    await GetStorage.init();
    Get.lazyPut<ILocalStorage>(() => LocalStorageService(GetStorage()),
        fenix: true);
  }
}
