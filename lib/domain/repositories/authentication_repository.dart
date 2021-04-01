import 'package:intera/domain/models/authentication_params.dart';
import 'package:intera/domain/models/user_information.dart';

abstract class IAuthenticationRepository {
  Future<UserInformation> loginWithEmail(AuthenticationParams params);
  Future<UserInformation> loginWithGoogle();
  Future<void> logout();
}