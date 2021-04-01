import 'package:intera/domain/repositories/authentication_repository.dart';

abstract class IResetPassword {
  Future<void> call(String email);
}

class ResetPassword extends IResetPassword {
  final IAuthenticationRepository repository;

  ResetPassword(this.repository);

  @override
  Future<void> call(String email) async {
    return await repository.resetPassword(email);
  }
}
