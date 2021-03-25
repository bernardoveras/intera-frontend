import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Settings {
  static Rx<ThemeMode> theme = ThemeMode.light.obs;
  static String username = 'Bernardo';
  static String? usernameImage =
      'https://avatars.githubusercontent.com/u/56937988?s=460&u=cf67cf7b78fc452958f03c63b16f29bb91881449&v=4';
}
