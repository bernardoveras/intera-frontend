import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/errors/firebase_errors.dart';
import 'package:intera/domain/repositories/authentication_repository.dart';

abstract class ICreateAccount {
  Future<UserCredential?> call(NewAccountParams params);
}

class CreateAccount extends ICreateAccount {
  final IAuthenticationRepository repository;

  CreateAccount(this.repository);

  @override
  Future<UserCredential?> call(NewAccountParams params) async {
    try {
      return await repository.createAccount(params);
    } on FirebaseAuthException catch (error) {
      throw FirebaseError.codeToError(error.code);
    } catch (e) {
      throw InternalError(message: e.toString());
    }
  }
}
