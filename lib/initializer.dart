import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
  }

  static void _startLocalStorage() {
    Get.lazyPut<ILocalStorage>(() => LocalStorageService(GetStorage()),
        fenix: true);
  }
}
