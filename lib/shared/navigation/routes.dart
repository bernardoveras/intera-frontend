import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/data/models/user_information_model.dart';
import 'package:intera/shared/settings.dart';

class Routes {
  static const HOME = '/';
  static const LOGIN = '/login';
  static const PROFILE = '/profile';

  static Future<String> get initialRoute async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    /// Caso o usuário tenha `setado`
    /// o lembrar-me, ele irá `puxar` do
    /// `local storage`, todas as `informações`.
    if (Settings.remember == true && currentUser != null) {
      Settings.user.value = UserInformationModel.fromFirebase(currentUser);
    } else if (currentUser != null) {
      await FirebaseAuth.instance.signOut();
    }

    if (Settings.user.value != null && Settings.remember == true) {
      return HOME;
    } else {
      return LOGIN;
    }
  }
}
