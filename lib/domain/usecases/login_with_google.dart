import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/domain/models/user_information.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/repositories/authentication_repository.dart';
import 'package:intera/core/consts.dart';

abstract class ILoginWithGoogle {
  Future<UserInformation?>? call();
}

class LoginWithGoogle implements ILoginWithGoogle {
  final IAuthenticationRepository repository;

  LoginWithGoogle(this.repository);

  // @override
  Future<UserInformation?>? call() async {
    try {
      return await repository.loginWithGoogle();
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        throw ErrorLoginEmail(message: Consts.USER_NOTFOUND);
      } else if (error.code == 'wrong-password') {
        throw ErrorLoginEmail(message: Consts.INCORRECT_PASSWORD);
      } else {
        throw InternalError(message: error.message);
      }
    } catch (e) {
      throw InternalError(message: e.toString());
    }
  }
}
