import 'dart:convert'; 
import 'package:get/get.dart';
import 'package:intera/data/models/user_information_model.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/shared/consts.dart';
import 'package:intera/shared/settings.dart';

class Routes {
  static const HOME = '/';
  static const LOGIN = '/login';

  static Future<String> get initialRoute async {
    /// Caso o usuário tenha `setado`
    /// o lembrar-me, ele irá `puxar` do
    /// `local storage`, todas as `informações`.
    if (Settings.remember == true) {
      ILocalStorage localStorage = Get.find();

      var userJson = await localStorage.get(PATH.USER);

      if (userJson != null) {
        final UserInformationModel user =
            UserInformationModel.fromJson(jsonDecode(userJson));
        Settings.user = user;
      }
    }

    if (Settings.user != null && Settings.remember == true) {
      return HOME;
    } else {
      return LOGIN;
    }
  }
}
