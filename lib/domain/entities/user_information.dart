import 'package:intera/data/models/user_information_model.dart';

class UserInformation {
  final String token;
  String? name;
  final String? pictureUrl;
  final String? email;

  UserInformation({
    required this.token,
    this.name,
    this.pictureUrl,
    this.email,
  });

  UserInformationModel toModel() {
    return UserInformationModel(
      token: token,
      email: email,
      name: name,
      pictureUrl: pictureUrl,
    );
  }
}
