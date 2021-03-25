import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/presentation/login/components/components.dart';
import 'package:intera/presentation/login/login_controller.dart';
import 'package:intera/presentation/login/login_page.dart';
import 'package:intera/shared/components/checkbox.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginForm({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => LoginTextField(
            titleText: 'E-mail',
            hintText: 'example@intera.com',
            keyboardType: TextInputType.emailAddress,
            onChanged: controller.email,
            controller: controller.emailController,
            focusNode: controller.emailFocus.value,
            textInputAction: TextInputAction.next,
            readOnly: controller.loading.value == true,
          ),
        ),
        SizedBox(height: 20.height),
        Obx(
          () => LoginTextField(
            titleText: 'Senha',
            hintText: 'Digite sua senha',
            obscure: true,
            onChanged: controller.senha,
            controller: controller.senhaController,
            focusNode: controller.senhaFocus.value,
            readOnly: controller.loading.value == true,
            preffixIcon: controller.enableButton == true ? Icon(
              Icons.check,
              color: Colors.green,
              size: 20.height,
            ) : null,
            onFieldSubmitted: (val) async {
              await controller.autenticar();
            },
          ),
        ),
        SizedBox(height: 30.height),
        Obx(
          () => ICheckBox(
            value: controller.remember.value!,
            title: 'Lembrar-me',
            onChanged: (value) {
              controller.remember.value = value;
            },
          ),
        ),
        SizedBox(height: 30.height),
        Obx(
          () => IButton(
            title: 'Entrar',
            loading: controller.loading.value ?? false,
            onTap: controller.enableButton == true
                ? () async {
                    await controller.autenticar();
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
