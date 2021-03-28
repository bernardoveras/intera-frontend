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

  factory UserInformationModel.fromFirebase(User user) {
    return UserInformationModel(
      token: user.uid,
      name: user.displayName,
      pictureUrl: user.photoURL,
      email: user.email,
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
