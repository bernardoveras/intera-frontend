import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/domain/entities/user_information.dart';

class UserInformationModel extends UserInformation {
  UserInformationModel({
    required String token,
    String? name,
    String? pictureUrl,
    String? email,
  }) : super(
          token: token,
          name: name,
          pictureUrl: pictureUrl,
          email: email,
        );

  factory UserInformationModel.fromFirebase(UserCredential credential) {
    if (credential.user?.uid == null)
      throw Exception('O usuário não possui um ID');

    return UserInformationModel(
      token: credential.user?.uid ?? '',
      name: credential.user?.displayName,
      pictureUrl: credential.user?.photoURL,
      email: credential.user?.email,
    );
  }

  factory UserInformationModel.fromJson(Map json) {
    return UserInformationModel(
      token: json['token'],
      name: json['name'],
      email: json['email'],
      pictureUrl: json['pictureUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'name': name,
      'pictureUrl': pictureUrl,
      'email': email,
    };
  }
}
