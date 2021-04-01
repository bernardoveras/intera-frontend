// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intera/presentation/login/components/components.dart';
// import 'package:intera/presentation/login/login_controller.dart';
// import 'package:intera/presentation/login/login_page.dart';
// import 'package:intera/core/components/checkbox.dart';
// import 'package:intera/core/extensions/screen_util_extension.dart';

// class LoginForm extends StatelessWidget {
//   final LoginController controller;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   LoginForm({Key? key, required this.controller}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Obx(
//           () => FadeInDown(
//             duration: Duration(milliseconds: 300),
//             delay: Duration(milliseconds: 300),
//             from: 30,
//             child: LoginTextField(
//               titleText: 'E-mail',
//               hintText: 'example@intera.com',
//               keyboardType: TextInputType.emailAddress,
//               onChanged: controller.email,
//               controller: controller.emailController,
//               focusNode: controller.emailFocus.value,
//               textInputAction: TextInputAction.next,
//               readOnly: controller.loading.value == true,
//               preffixIcon: controller.validateEmail == true
//                   ? Icon(
//                       Icons.check,
//                       color: Colors.green,
//                       size: 20.height,
//                     )
//                   : null,
//             ),
//           ),
//         ),
//         SizedBox(height: 20.height),
//         Obx(
//           () => FadeInDown(
//             delay: Duration(milliseconds: 300),
//             duration: Duration(milliseconds: 300),
//             from: 30,
//             child: LoginTextField(
//               titleText: 'Senha',
//               hintText: 'Digite sua senha',
//               obscure: true,
//               onChanged: controller.senha,
//               controller: controller.senhaController,
//               focusNode: controller.senhaFocus.value,
//               readOnly: controller.loading.value == true,
//               preffixIcon: controller.validateSenha == true
//                   ? Icon(
//                       Icons.check,
//                       color: Colors.green,
//                       size: 20.height,
//                     )
//                   : null,
//               onFieldSubmitted: controller.enableButton == true
//                   ? (val) async {
//                       await controller.autenticar();
//                     }
//                   : null,
//             ),
//           ),
//         ),
//         SizedBox(height: 30.height),
//         Obx(
//           () => FadeInLeft(
//             duration: Duration(milliseconds: 300),
//             delay: Duration(milliseconds: 300),
//             from: 30,
//             child: ICheckBox(
//               value: controller.remember.value!,
//               name: 'Lembrar-me',
//               onChanged: (value) {
//                 controller.remember.value = value;
//               },
//             ),
//           ),
//         ),
//         SizedBox(height: 30.height),
//         Obx(
//           () => FadeInUp(
//             duration: Duration(milliseconds: 300),
//             delay: Duration(milliseconds: 400),
//             from: 30,
//             child: IButton(
//               name: 'Entrar',
//               loading: controller.loading.value ?? false,
//               onTap: controller.enableButton == true
//                   ? () async {
//                       await controller.autenticar();
//                     }
//                   : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
