import 'package:intera/domain/repositories/authentication_repository.dart';

abstract class ILogout {
  Future<void> call();
}

class Logout extends ILogout {
  final IAuthenticationRepository repository;

  Logout(this.repository);

  @override
  Future<void> call() async {
    return await repository.logout();
  }
}
