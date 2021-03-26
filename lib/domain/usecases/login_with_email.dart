import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/domain/entities/authentication_params.dart';
import 'package:intera/domain/entities/user_information.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/repositories/authentication_repository.dart';
import 'package:intera/shared/consts.dart';

abstract class ILoginWithEmail {
  Future<UserInformation?>? call(AuthenticationParams params);
}

class LoginWithEmail implements ILoginWithEmail {
  final IAuthenticationRepository repository;

  LoginWithEmail(this.repository);

  // @override
  Future<UserInformation?>? call(AuthenticationParams params) async {
    try {
      return await repository.loginWithEmail(params);
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
