import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _setStatusBar();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static void _setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
  }
}
