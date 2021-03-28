import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intera/data/models/user_information_model.dart';
import 'package:intera/domain/entities/authentication_params.dart';
import 'package:intera/domain/entities/user_information.dart';
import 'package:intera/domain/repositories/authentication_repository.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/shared/consts.dart';
import 'package:intera/shared/navigation/routes.dart';
import 'package:intera/shared/services/dialog_service.dart';
import 'package:intera/shared/settings.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final FirebaseAuth firebaseAuth;
  final ILocalStorage localStorage;
  final IDialogService dialogService;

  AuthenticationRepository(
      this.firebaseAuth, this.localStorage, this.dialogService);

  @override
  Future<UserInformation> loginWithEmail(AuthenticationParams params) async {
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    return UserInformationModel.fromFirebase(userCredential.user!);
  }

  @override
  Future<void> logout() async {
    await dialogService.confirmationDialog(
      title: 'Sair da conta',
      content: 'Deseja realmente sair da sua conta?',
      cancelText: 'Cancelar',
      onConfirm: () async {
        await firebaseAuth.signOut();
        await _clearSettingsAndStorage();
        Get.offAllNamed(Routes.LOGIN);
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
