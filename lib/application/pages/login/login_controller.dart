import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/models/user_information.dart';
import 'package:intera/domain/serializers/user_information_serializer.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/domain/usecases/login_with_google.dart';
import 'package:intera/core/consts.dart';
import 'package:intera/core/navigation/routes.dart';
import 'package:intera/core/services/dialog_service.dart';
import 'package:intera/core/settings.dart';

class LoginController extends GetxController {
  final ILocalStorage localStorage;
  final ILoginWithGoogle loginWithGoogle;
  final IDialogService dialogService;

  LoginController(
      {required this.localStorage,
      required this.loginWithGoogle,
      required this.dialogService});

  RxBool loading = false.obs;

  Future<void> autenticarComGoogle() async {
    final UserInformationSerializer serializer = UserInformationSerializer();

    loading.value = true;

    FocusManager.instance.primaryFocus?.unfocus();
    try {
      var result = await loginWithGoogle();

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
      );
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
}
