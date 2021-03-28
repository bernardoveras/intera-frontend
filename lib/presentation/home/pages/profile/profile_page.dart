import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/presentation/login/login_page.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';
import 'package:intera/shared/services/dialog_service.dart';
import 'package:intera/shared/settings.dart';

import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  final IDialogService dialogService = Get.find();

  final String? name = Settings.user.value?.name;
  final String? email = Settings.user.value?.email;

  Future<bool> alertOnExit() async {
    bool close = false;
    await dialogService.confirmationDialog(
      title: 'Atenção',
      content:
          'Foram feitas alterações no perfil.\nDeseja sair sem gravar as alterações?',
      confirmationText: 'Sair',
      cancelText: 'Cancelar',
      onConfirm: () {
        close = true;
      },
    );
    return close;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 24.width),
              child: IconButton(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.close,
                  color: Colors.grey.shade900,
                  size: 24.height,
                ),
                onPressed: () async {
                  if (controller.houveAlteracao.value == true) {
                    bool? close = await alertOnExit();

                    if (close == true) Get.back();
                  } else {
                    Get.back();
                  }
                },
              ),
            ),
          ],
          leading: SizedBox.shrink(),
          title: FadeInDown(
            duration: Duration(milliseconds: 300),
            delay: Duration(milliseconds: 200),
            from: 20,
            child: Text(
              'Perfil',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.all(24.height),
          child: FadeInUp(
            delay: Duration(milliseconds: 300),
            duration: Duration(milliseconds: 300),
            child: Obx(
              () => IButton(
                title: 'Salvar',
                loading: controller.loading.value ?? false,
                onTap: controller.houveAlteracao.value == true
                    ? () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        await controller.salvarAlteracoes();
                      }
                    : null,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              top: 24.height,
              left: 24.width,
              right: 24.width,
              bottom: 130.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInUp(
                  from: 20,
                  delay: Duration(milliseconds: 200),
                  duration: Duration(milliseconds: 300),
                  child: Center(
                    child: Container(
                      height: 80.height,
                      width: 80.width,
                      clipBehavior: Clip.antiAlias,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3.width),
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        image: Settings.user.value!.pictureUrl != null &&
                                controller.connectivityService.isConnected
                            ? DecorationImage(
                                fit: BoxFit.fill,
                                alignment: Alignment.center,
                                colorFilter: ColorFilter.mode(
                                    Theme.of(context).primaryColor,
                                    BlendMode.color),
                                image: CachedNetworkImageProvider(
                                  Settings.user.value!.pictureUrl!,
                                ),
                              )
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 24.height,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.height),
                Obx(
                  () => Settings.user.value?.name != null
                      ? FadeInUp(
                          from: 20,
                          duration: Duration(milliseconds: 300),
                          child: Text(
                            Settings.user.value!.name!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
                SizedBox(height: name != null ? 2.height : 0),
                email != null
                    ? FadeInUp(
                        from: 20,
                        duration: Duration(milliseconds: 300),
                        delay: Duration(milliseconds: 270),
                        child: Text(
                          email!,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: name != null ? 16.sp : 24.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 24.height),
                FadeInLeft(
                  duration: Duration(milliseconds: 400),
                  child: Obx(
                    () => EditTextField(
                      controller: controller.nomeController,
                      onChanged: controller.setNome,
                      labelText: 'Editar nome',
                      focusNode: controller.nomeFocus.value,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(height: 20.height),
                FadeInLeft(
                  delay: Duration(milliseconds: 200),
                  duration: Duration(milliseconds: 400),
                  child: Obx(
                    () => EditTextField(
                      controller: controller.emailController,
                      onChanged: controller.setEmail,
                      labelText: 'Editar e-mail',
                      keyboardType: TextInputType.emailAddress,
                      focusNode: controller.emailFocus.value,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(height: 20.height),
                FadeInLeft(
                  delay: Duration(milliseconds: 200),
                  duration: Duration(milliseconds: 400),
                  child: Obx(
                    () => EditTextField(
                      controller: controller.senhaController,
                      onChanged: controller.setSenha,
                      labelText: 'Editar senha',
                      keyboardType: TextInputType.visiblePassword,
                      focusNode: controller.senhaFocus.value,
                      obscure: true,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (v) => controller.salvarAlteracoes(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EditTextField extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool obscure;

  const EditTextField({
    Key? key,
    this.labelText,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onChanged,
    this.focusNode,
    this.controller,
    this.obscure = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      obscureText: obscure,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      initialValue: initialValue,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
        disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300)),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.sp,
        ),
        suffixIcon: Icon(
          Icons.edit,
          color: Colors.grey,
          size: 20.height,
        ),
      ),
    );
  }
}
