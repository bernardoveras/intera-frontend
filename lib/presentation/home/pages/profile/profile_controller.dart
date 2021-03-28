import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/domain/repositories/profile_repository.dart';
import 'package:intera/shared/services/connectivity_services.dart';
import 'package:intera/shared/services/dialog_service.dart';
import 'package:intera/shared/settings.dart';

class ProfileController extends GetxController {
  final IProfileRepository repository;
  final ConnectivityService connectivityService = Get.find();
  final IDialogService dialogService;

  ProfileController(this.repository, this.dialogService);

  RxBool houveAlteracao = false.obs;
  RxBool loading = false.obs;

  RxString nome = ''.obs;
  late TextEditingController nomeController;
  final nomeError = RxString();
  final nomeFocus = FocusNode().obs;
  void setNome(String value) {
    nome.value = value;
    houveAlteracao.value = true;
  }

  RxString email = ''.obs;
  late TextEditingController emailController;
  final emailError = RxString();
  final emailFocus = FocusNode().obs;
  void setEmail(String value) {
    email.value = value;
    houveAlteracao.value = true;
  }

  RxString senha = ''.obs;
  late TextEditingController senhaController;
  final senhaError = RxString();
  final senhaFocus = FocusNode().obs;
  void setSenha(String value) {
    senha.value = value;
    houveAlteracao.value = true;
  }

  Future<void> salvarAlteracoes() async {
    try {
      loading.value = true;
      if (connectivityService.isConnected == true) {
        if (email.value != null && email.value != '') {
          await repository.changeEmail(email.value!);
        }

        if (nome.value != null && nome.value != '') {
          await repository.changeName(nome.value!);
        }

        dialogService.confirmationDialog(
          title: 'Sucesso!',
          content: 'As alterações foram salvas com sucesso!',
          alignment: Alignment.center,
          textAlign: TextAlign.center,
        );

        houveAlteracao.value = false;
      } else if (connectivityService.isConnected == false) {
        dialogService.confirmationDialog(
          title: 'Algo está errado!',
          content:
              'Você está sem internet, conecte-se a internet e tente novamente',
          confirmationText: 'Tentar novamente',
          alignment: Alignment.center,
          textAlign: TextAlign.center,
        );
      }
    } on FirebaseAuthException catch (error) {
      dialogService.confirmationDialog(
        title: 'Ocorreu um erro',
        content: error.message,
        confirmationText: 'Tentar novamente',
        alignment: Alignment.center,
        textAlign: TextAlign.center,
      );
    } catch (e) {
      print(e);
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    nomeController = TextEditingController(text: Settings.user.value?.name);
    emailController = TextEditingController(text: Settings.user.value?.email);
    senhaController = TextEditingController(text: senha.value);
  }

  @override
  void onClose() {
    super.onClose();
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();

    nomeFocus.close();
    emailFocus.close();
    senhaFocus.close();
  }
}
