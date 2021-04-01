import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intera/domain/models/authentication_params.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/models/user_information.dart';
import 'package:intera/domain/serializers/user_information_serializer.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/domain/usecases/login_with_email.dart';
import 'package:intera/core/consts.dart';
import 'package:intera/core/navigation/routes.dart';
import 'package:intera/core/services/dialog_service.dart';
import 'package:intera/core/settings.dart';

class LoginWithEmailController extends GetxController {
  final ILocalStorage localStorage;
  final ILoginWithEmail loginWithEmail;
  final IDialogService dialogService;
  final UserInformationSerializer serializer = UserInformationSerializer();

  LoginWithEmailController(
      {required this.localStorage,
      required this.loginWithEmail,
      required this.dialogService});

  ///[E-mail]
  RxString email = ''.obs;
  late TextEditingController emailController;
  final emailError = RxString();
  final emailFocus = FocusNode().obs;

  ///[Senha]
  RxString senha = ''.obs;
  late TextEditingController senhaController;
  final senhaError = RxString();
  final senhaFocus = FocusNode().obs;

  bool get enableButton => validateEmail && validateSenha;

  bool get validateEmail =>
      email.value?.isEmail == true && email.value.isBlank == false;
  bool get validateSenha =>
      senha.value.isBlank == false && senha.value!.length >= 6;

  ///[Remember-me]
  RxBool remember = false.obs;

  RxBool loading = false.obs;

  Future<void> autenticar() async {
    loading.value = true;

    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var result = await loginWithEmail(
        AuthenticationParams(email.value!, senha.value!),
      );

      if (remember.value != null && result != null) {
        Settings.remember = remember.value!;
        await localStorage.add(PATH.REMEMBER, Settings.remember.toString());
      }

      if (result != null) {
        UserInformation user = result;
        Settings.user.value = user;
        if (Settings.remember)
          await localStorage.add(PATH.USER, jsonEncode(serializer.mapOf(user)));

        Get.offAllNamed(Routes.HOME);
      }
    } on ErrorLoginEmail catch (error) {
      /// Fazer um notify com o `error.message`
      dialogService.confirmationDialog(
          name: error.message,
          content: error.message == Consts.USER_NOTFOUND
              ? 'O usuário informado não foi encontrado, verifique seu nome de usuário'
              : error.message == Consts.INCORRECT_PASSWORD
                  ? 'A senha informada está incorreta, verifique e tente novamente'
                  : error.message,
          confirmationText: 'Tentar novamente',
          alignment: Alignment.center,
          textAlign: TextAlign.center,
          onConfirm: () {
            if (error.message == Consts.INCORRECT_PASSWORD) {
              senhaFocus.value?.requestFocus();
            } else {
              emailFocus.value?.requestFocus();
            }
          });
    } on InternalError catch (error) {
      print(error.message);
      Get.rawSnackbar(
        message: error.message,
        backgroundColor: Colors.red,
      );
      loading.value = false;
    } catch (error) {
      print(error);
      loading.value = false;
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    remember.value = Settings.remember;
    emailController = TextEditingController(text: email.value);
    senhaController = TextEditingController(text: senha.value);
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    senhaController.dispose();
    emailFocus.close();
    senhaFocus.close();
  }
}
