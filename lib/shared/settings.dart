import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Settings {
  static Rx<ThemeMode> theme = ThemeMode.light.obs;
  static String username = 'Bernardo';
  static Rx<Uint8List>? usernameImage = Rx<Uint8List>();
}
