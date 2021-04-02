import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/domain/models/authentication_params.dart';
import 'package:intera/domain/models/user_information.dart';

abstract class IAuthenticationRepository {
  Future<UserInformation> loginWithEmail(AuthenticationParams params);
  Future<UserInformation> loginWithGoogle();
  Future<void> logout();
  Future<void> resetPassword(String email);
  Future<UserCredential?> createAccount(NewAccountParams params);
}

class NewAccountParams{
  final String name;
  final String email;
  final String password;

  NewAccountParams(this.name, this.email, this.password);
}