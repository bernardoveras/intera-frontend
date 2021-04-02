import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/domain/errors/firebase_errors.dart';
import 'package:intera/domain/models/authentication_params.dart';
import 'package:intera/domain/models/user_information.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/repositories/authentication_repository.dart';
import 'package:intera/core/consts.dart';

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
      throw FirebaseError.codeToError(error.code);
    } catch (e) {
      throw InternalError(message: e.toString());
    }
  }
}
