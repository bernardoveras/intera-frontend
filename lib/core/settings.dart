import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intera/domain/models/user_information.dart';

class Settings {
  static Rx<UserInformation?> user = Rx<UserInformation?>();
  static Rx<ThemeMode> theme = ThemeMode.light.obs;
  static Rx<Uint8List>? usernameImage = Rx<Uint8List>();

  static AuthType? authType;

  /// Visualizar o `componente` de total
  /// das interas na tela inicial!
  static RxBool exibirTotalDeInteras = true.obs;

  static bool remember = false;

  static void clear() {
    Settings.authType = null;
    user.value = null;
    exibirTotalDeInteras.value = true;
  }
}

enum AuthType {
  email,
  apple,
  google,
}

extension AuthTypeExtension on String {
  AuthType get indexToAuthType {
    switch (this) {
      case '0':
        return AuthType.email;
      case '1':
        return AuthType.apple;
      case '2':
        return AuthType.google;
      default:
        return AuthType.email;
    }
  }
}
