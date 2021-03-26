import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intera/domain/services/local_storage_service.dart';
import 'package:intera/shared/consts.dart';
import 'package:intera/shared/settings.dart';

class LoginController extends GetxController {
  final ILocalStorage localStorage;

  LoginController({required this.localStorage});

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
    try {
      // ToDo: Implementar a autenticação
      if (remember.value != null) {
        Settings.remember = remember.value!;
        await localStorage.add(PATH.REMEMBER, Settings.remember.toString());
      }
    } catch (e) {
      print(e);
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
