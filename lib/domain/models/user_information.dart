import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserInformation extends Equatable{
  final String token;
  String? name;
  final String? pictureUrl;
  final String? email;

  UserInformation({
    required this.token,
    this.name,
    this.pictureUrl,
    this.email,
  }): assert(token.isNotEmpty);

  @override
  List<Object?> get props => [token, email, name, pictureUrl];

}
