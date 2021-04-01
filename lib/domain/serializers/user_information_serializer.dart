import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intera/domain/models/user_information.dart';
import 'package:intera/domain/serializers/json_serializer.dart';

class UserInformationSerializer implements JsonSerializer<UserInformation> {
  @override
  UserInformation fromMap(Map<String, dynamic> json) {
    final token = json['token'] as String;
    final email = json['email'] as String;
    final name = json['name'] as String;
    final pictureUrl = json['pictureUrl'] as String;

    return UserInformation(
      token: token,
      email: email,
      name: name,
      pictureUrl: pictureUrl,
    );
  }

  @override
  Map<String, dynamic> mapOf(UserInformation user) => <String, dynamic>{
        'token': user.token,
        'email': user.email,
        'name': user.name,
        'pictureUrl': user.pictureUrl,
      };

  UserInformation fromFirebase(User user) {
    return UserInformation(
      token: user.uid,
      name: user.displayName,
      pictureUrl: user.photoURL,
      email: user.email,
    );
  }

  UserInformation fromGoogle(GoogleSignInAccount user) {
    return UserInformation(
      token: user.id,
      name: user.displayName,
      pictureUrl: user.photoUrl,
      email: user.email,
    );
  }
}
