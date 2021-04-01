import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intera/domain/models/authentication_params.dart';
import 'package:intera/domain/models/user_information.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/repositories/authentication_repository.dart';
import 'package:intera/domain/serializers/user_information_serializer.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/core/consts.dart';
import 'package:intera/application/navigation/routes.dart';
import 'package:intera/core/services/dialog_service.dart';
import 'package:intera/core/settings.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository(
      this.firebaseAuth, this.localStorage, this.dialogService);

  final FirebaseAuth firebaseAuth;
  final ILocalStorage localStorage;
  final IDialogService dialogService;
  final UserInformationSerializer serializer = UserInformationSerializer();

  @override
  Future<UserInformation> loginWithEmail(AuthenticationParams params) async {
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    Settings.authType = AuthType.email;
    return serializer.fromFirebase(userCredential.user!);
  }

  @override
  Future<UserInformation> loginWithGoogle() async {
    final GoogleSignIn signIn = GoogleSignIn(scopes: ['email']);

    GoogleSignInAccount? googleCredential = await signIn.signIn();

    if (googleCredential != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await signIn.currentUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      Settings.authType = AuthType.google;
      await localStorage.add(
          PATH.AUTH_TYPE, Settings.authType!.index.toString());

      return serializer.fromFirebase(userCredential.user!);
    } else {
      throw InternalError(message: 'Não conseguimos conectar com a Google');
    }
  }

  @override
  Future<void> logout() async {
    await dialogService.confirmationDialog(
      name: 'Sair da conta',
      content: 'Deseja realmente sair da sua conta?',
      cancelText: 'Cancelar',
      onConfirm: () async {
        await firebaseAuth.signOut();
        await _clearSettingsAndStorage();
        Get.offAllNamed(Routes.LOGIN);
      },
    );
  }

  @override
  Future<void> resetPassword(String email) async {
    await dialogService.confirmationDialog(
      name: 'Redefinir senha',
      content: 'Deseja realmente redefinir sua senha?',
      cancelText: 'Cancelar',
      // closeOnConfirm: false,
      onConfirm: () async {
        await firebaseAuth.sendPasswordResetEmail(email: email);
      },
    );
  }

  Future<void> _clearSettingsAndStorage() async {
    await localStorage.remove(PATH.USER);
    await localStorage.remove(PATH.EXIBIR_TOTAL_INTERAS);
    await localStorage.remove(PATH.THEME);

    Settings.clear();
  }
}
