import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intera/core/services/dialog_service.dart';
import 'package:intera/core/theme/theme.dart';
import 'package:intera/domain/errors/errors.dart';
import 'package:intera/domain/usecases/reset_password.dart';

class ResetPasswordController extends GetxController {
  ResetPasswordController(
      IResetPassword resetPassword, IDialogService dialogService) {
    _resetPassword = resetPassword;
    _dialogService = dialogService;
  }
  late IDialogService _dialogService;
  late IResetPassword _resetPassword;

  ///[E-mail]
  RxString email = ''.obs;
  late TextEditingController emailController;

  bool get enableButton => validateEmail;

  bool get validateEmail =>
      email.value?.isEmail == true && email.value.isBlank == false;

  RxBool loading = false.obs;

  Future<void> resetPassword() async {
    loading.value = true;

    FocusManager.instance.primaryFocus?.unfocus();
    try {
      await _resetPassword(email.value!);
      await _dialogService.confirmationDialog(
        name: 'Sucesso!',
        content: 'Enviamos um link para redefinir sua senha para seu e-mail',
        alignment: Alignment.center,
        textAlign: TextAlign.center,
      );
      Get.back();
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
    emailController = TextEditingController(text: email.value);
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}
