import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/repositories/profile_repository.dart';
import 'package:intera/core/settings.dart';

class ProfileRepository implements IProfileRepository {
  @override
  Future<void> changeName(String name) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.currentUser!.updateProfile(displayName: name);

      Settings.user.update((val) {
        Settings.user.value?.name =
            FirebaseAuth.instance.currentUser!.displayName;
      });
    } else {
      throw InternalError(message: 'Não foi encontrado o usuário');
    }
  }

  @override
  Future<void> changeEmail(String email) async {
    // if (FirebaseAuth.instance.currentUser != null) {
    //   return await FirebaseAuth.instance.currentUser!.updateEmail(email);
    // } else {
    //   throw InternalError(message: 'Não foi encontrado o usuário');
    // }
  }

  @override
  Future<void> changePassword(String password) async {
    // TODO: implement changePassword
    throw UnimplementedError();
  }
}
