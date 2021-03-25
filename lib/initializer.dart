import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      _setStatusBar();
      _startLocalStorage();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static void _setStatusBar() {
    Settings.theme == ThemeMode.light
        ? AppTheme.changeStatusBar<Dark>()
        : AppTheme.changeStatusBar<Light>();
  }

  static void _startLocalStorage() {
    Get.lazyPut<ILocalStorage>(() => LocalStorageService(GetStorage()),
        fenix: true);
  }
}
