import 'package:intera/domain/entities/authentication_params.dart';
import 'package:intera/domain/entities/user_information.dart';

abstract class IAuthenticationRepository {
  Future<UserInformation> loginWithEmail(AuthenticationParams params);
  Future<void> logout();
}