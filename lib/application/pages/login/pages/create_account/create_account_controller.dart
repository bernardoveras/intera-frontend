import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intera/application/navigation/routes.dart';
import 'package:intera/core/consts.dart';
import 'package:intera/core/settings.dart';
import 'package:intera/core/theme/theme.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/errors/firebase_errors.dart';
import 'package:intera/domain/models/authentication_params.dart';
import 'package:intera/domain/models/user_information.dart';
import 'package:intera/domain/repositories/authentication_repository.dart';
import 'package:intera/domain/serializers/user_information_serializer.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/domain/usecases/create_account.dart';

class CreateAccountController extends GetxController {
  CreateAccountController(ICreateAccount createAccount, ILocalStorage localStorage) {
    _createAccount = createAccount;
    _localStorage = localStorage;
  }

  late ICreateAccount _createAccount;
  late ILocalStorage _localStorage;
  final UserInformationSerializer serializer = UserInformationSerializer(); 

  ///[Senha]
  RxString name = ''.obs;
  late TextEditingController nameController;
  final nameError = RxString();
  final nameFocus = FocusNode().obs;

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

  bool get enableButton => validateEmail && validateSenha && validateName;

  bool get validateEmail =>
      email.value?.isEmail == true && email.value.isBlank == false;
  bool get validateSenha =>
      senha.value.isBlank == false && senha.value!.length >= 6;
  bool get validateName => name.value.isBlank == false;

  RxBool loading = false.obs;

  Future<void> createAccount() async {
    loading.value = true;

    FocusManager.instance.primaryFocus?.unfocus();
    try {
      // ToDo: implementar a criação de conta
      var result = await _createAccount.call(
        NewAccountParams(name.value!, email.value!, senha.value!),
      );

      if (result != null) {
        UserInformation user = serializer.fromFirebase(result.user!);
        Settings.user.value = user;

        await _localStorage.add(PATH.USER, jsonEncode(serializer.mapOf(user)));
        await _localStorage.add(PATH.REMEMBER, 'true');

        Get.offAllNamed(Routes.HOME);
        Get.rawSnackbar(
          message: 'Bem-vindo(a) ao intera!',
          backgroundColor: AppTheme.primary,
        );
      }
    } on FirebaseError catch (error) {
      print(error);
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

    nameController = TextEditingController(text: name.value);
    emailController = TextEditingController(text: email.value);
    senhaController = TextEditingController(text: senha.value);
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    senhaController.dispose();
    nameFocus.close();
    emailFocus.close();
    senhaFocus.close();
  }
}
