import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intera/application/pages/login/components/components.dart';
import 'package:intera/application/pages/login/login_page.dart';
import 'package:intera/core/extensions/screen_util_extension.dart';
import 'create_account_controller.dart';

class CreateAccountPage extends GetView<CreateAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            margin: EdgeInsets.all(14.height),
            alignment: Alignment.center,
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 14.height,
                color: Colors.grey.shade900,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(20.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInLeft(
                duration: Duration(milliseconds: 300),
                child: Text(
                  'Criar uma conta',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.sp,
                  ),
                ),
              ),
              SizedBox(height: 40.height),
              Obx(
                () => FadeInLeft(
                  duration: Duration(milliseconds: 300),
                  delay: Duration(milliseconds: 200),
                  child: LoginTextField(
                    titleText: 'Nome',
                    hintText: 'Insira seu nome aqui',
                    focusNode: controller.nameFocus.value,
                    titleStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    borderRadius: BorderRadius.circular(4.radius),
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.radius),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5.width,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    onChanged: controller.name,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              SizedBox(height: 20.height),
              Obx(
                () => FadeInLeft(
                  duration: Duration(milliseconds: 300),
                  delay: Duration(milliseconds: 200),
                  child: LoginTextField(
                    titleText: 'Email',
                    hintText: 'Insira seu email aqui',
                    focusNode: controller.emailFocus.value,
                    titleStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    borderRadius: BorderRadius.circular(4.radius),
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.radius),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5.width,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    onChanged: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ),
              ),
              SizedBox(height: 20.height),
              Obx(
                () => FadeInLeft(
                  duration: Duration(milliseconds: 300),
                  delay: Duration(milliseconds: 400),
                  child: LoginTextField(
                    titleText: 'Senha',
                    hintText: 'Insira sua senha aqui',
                    focusNode: controller.senhaFocus.value,
                    titleStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    borderRadius: BorderRadius.circular(4.radius),
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.radius),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 1.5.width,
                      ),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    onChanged: controller.senha,
                    obscure: true,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (v) => controller.createAccount(),
                  ),
                ),
              ),
              SizedBox(height: 30.height),
              Obx(
                () => FadeInUp(
                  duration: Duration(milliseconds: 300),
                  delay: Duration(milliseconds: 300),
                  child: IButton(
                    onTap: controller.enableButton == true
                        ? controller.createAccount
                        : null,
                    name: 'Criar conta',
                    loading: controller.loading.value ?? false,
                    borderRadius: BorderRadius.circular(4.radius),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
