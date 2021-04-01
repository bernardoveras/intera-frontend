import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:intera/data/repositories/authentication_repository.dart';
import 'package:intera/core/helpers/theme_helper.dart';
import 'package:intera/core/services/connectivity_services.dart';
import '../domain/repositories/authentication_repository.dart';
import '../core/consts.dart';
import '../core/extensions/int_extensions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intera/core/settings.dart';
import 'package:intera/core/theme/theme.dart';
import '../core/extensions/shared_extensions.dart';
import '../data/services/local_storage_service.dart';
import '../domain/services/local_storage_service.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import '../core/services/dialog_service.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _startFirebase();
      await _startFirebaseCrashlytics();
      await _startLocalStorage();
      await _startTheme();
      await _startAllSettings();
      _startServices();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static void _startServices() {
    Get.lazyPut<ConnectivityService>(() => ConnectivityService(), fenix: true);
    Get.lazyPut<IDialogService>(
      () => DialogService(),
      fenix: true,
    );
    Get.lazyPut<IAuthenticationRepository>(
      () => AuthenticationRepository(
        FirebaseAuth.instance,
        Get.find(),
        Get.find(),
      ),
      fenix: true,
    );
  }

  static Future<void> _startFirebase() async {
    await Firebase.initializeApp();
  }

  static Future<void> _startFirebaseCrashlytics() async {
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
      );
    }).sendPort);
  }

  static Future<void> _startUserSettings(ILocalStorage storage) async {
    String? imageBase64 = await storage.get(PATH.USER_IMAGE);
    String? remember = await storage.get(PATH.REMEMBER);
    String? rawAuthType = await storage.get(PATH.AUTH_TYPE);

    Uint8List? imageDecoded =
        imageBase64 != null ? base64Decode(imageBase64) : null;

    if (remember != null) {
      Settings.remember = remember.toBool;
    }

    if (rawAuthType != null) {
      AuthType authType = rawAuthType.indexToAuthType;
      Settings.authType = authType;
      
      if (authType != AuthType.email) {
        Settings.remember = true;
      }
    }

    if (imageDecoded != null) {
      Settings.usernameImage?.value = imageDecoded;
    }
  }

  static Future<void> _startAllSettings() async {
    ILocalStorage storage = Get.find();

    await _startUserSettings(storage);

    String? exibirTotalDeInteras = await storage.get(PATH.EXIBIR_TOTAL_INTERAS);

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
