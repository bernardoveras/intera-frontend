import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intera/shared/helpers/theme_helper.dart';
import 'shared/consts.dart';
import 'shared/extensions/int_extensions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intera/shared/settings.dart';
import 'package:intera/shared/theme/theme.dart';
import 'shared/extensions/shared_extensions.dart';
import 'data/services/local_storage_service.dart';
import 'domain/services/local_storage_service.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _startLocalStorage();
      await _startTheme();
      await _startAllSettings();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<void> _startUserSettings(ILocalStorage storage) async {
    String? imageBase64 = await storage.get(PATH.USER_IMAGE);

    Uint8List? imageDecoded =
        imageBase64 != null ? base64Decode(imageBase64) : null;

    if (imageDecoded != null) {
      Settings.usernameImage?.value = imageDecoded;
    }
  }

  static Future<void> _startAllSettings() async {
    ILocalStorage storage = Get.find();

    await _startUserSettings(storage);

    String? exibirTotalDeInteras =
        await storage.get(PATH.EXIBIR_TOTAL_INTERAS);

    if (exibirTotalDeInteras != null) {
      Settings.exibirTotalDeInteras.value = exibirTotalDeInteras.toBool;
    }
  }

  static Future<void> _startTheme() async {
    ILocalStorage storage = Get.find();

    int? theme = int.tryParse(await storage.get(PATH.THEME) ?? 'null');

    if (theme != null) {
      Settings.theme.value = theme.toThemeMode;
    }

    Settings.theme.value == ThemeMode.light
        ? AppTheme.changeStatusBar<Dark>()
        : AppTheme.changeStatusBar<Light>();
  }

  static Future<void> _startLocalStorage() async {
    await GetStorage.init();
    Get.lazyPut<ILocalStorage>(
      () => LocalStorageService(GetStorage()),
      fenix: true,
    );
  }
}
