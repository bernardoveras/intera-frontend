import 'package:equatable/equatable.dart';

class AuthenticationParams extends Equatable {
  final String email;
  final String password;

  AuthenticationParams(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
