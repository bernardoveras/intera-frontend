import 'package:firebase_auth/firebase_auth.dart';
import 'package:intera/data/models/user_information_model.dart';
import 'package:intera/domain/entities/authentication_params.dart';
import 'package:intera/domain/entities/user_information.dart';
import 'package:intera/domain/repositories/authentication_repository.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final FirebaseAuth firebaseAuth;

  AuthenticationRepository(this.firebaseAuth);

  @override
  Future<UserInformation> loginWithEmail(AuthenticationParams params) async {
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    return UserInformationModel.fromFirebase(userCredential);
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
