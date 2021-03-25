import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Settings {
  static String username = 'Bernardo';
  static Rx<ThemeMode> theme = ThemeMode.light.obs;
  static Rx<Uint8List>? usernameImage = Rx<Uint8List>();

  /// Visualizar o `componente` de total
  /// das interas na tela inicial!
  static RxBool exibirTotalDeInteras = true.obs;
}
