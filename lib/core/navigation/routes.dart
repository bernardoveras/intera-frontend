import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/core/settings.dart';
import 'package:intera/domain/serializers/user_information_serializer.dart';

class Routes {
  static const HOME = '/';
  static const LOGIN = '/login';
  static const LOGIN_WITH_EMAIL = '/login/email';
  static const PROFILE = '/profile';

  static Future<String> get initialRoute async {
    final UserInformationSerializer serializer = UserInformationSerializer();
    User? currentUser = FirebaseAuth.instance.currentUser;

    /// Caso o usuário tenha `setado`
    /// o lembrar-me, ele irá `puxar` do
    /// `local storage`, todas as `informações`.
    if (Settings.remember == true && currentUser != null) {
      Settings.user.value = serializer.fromFirebase(currentUser);
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
