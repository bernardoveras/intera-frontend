import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intera/core/components/circular_loading.dart';
import 'package:intera/core/extensions/screen_util_extension.dart';
import 'package:intera/application/navigation/routes.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 30.width, vertical: 50.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInDown(
                  duration: Duration(milliseconds: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LineIcons.alternateWavyMoneyBill,
                        color: Theme.of(context).primaryColor,
                        size: 50.height,
                      ),
                      SizedBox(height: 20.height),
                      Text(
                        'Seja bem-vindo(a)\na Intera',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                FadeInUp(
                  duration: Duration(milliseconds: 400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginButton(
                        name: 'Continuar com Email',
                        icon: Icons.mail_outline_rounded,
                        onTap: () => Get.toNamed(Routes.LOGIN_WITH_EMAIL),
                      ),
                      SizedBox(height: 10.height),
                      LoginButton(
                        name: 'Continuar com Apple',
                        icon: LineIcons.apple,
                        onTap: () {},
                      ),
                      SizedBox(height: 10.height),
                      LoginButton(
                        name: 'Continuar com Google',
                        icon: LineIcons.googlePlus,
                        onTap: () async =>
                            await controller.autenticarComGoogle(),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => FadeInUp(
                    duration: Duration(milliseconds: 300),
                    delay: Duration(milliseconds: 700),
                    from: 30,
                    child: OutlinedButton(
                      onPressed: controller.loading.value == false
                          ? () {
                              Get.toNamed(Routes.CREATE_ACCOUNT);
                            }
                          : null,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        primary: Theme.of(context).backgroundColor,
                        shadowColor: Colors.red,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        minimumSize: Size(double.infinity, 45.height),
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                          ),
                          children: [
                            TextSpan(text: "Ainda não tem uma conta? "),
                            TextSpan(
                              text: "Crie uma agora!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final void Function() onTap;
  const LoginButton({
    required this.name,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 50.height,
        width: 210.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              this.icon,
              size: 24.height,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              width: 175.width,
              child: AutoSizeText(
                this.name,
                maxFontSize: 17,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IButton extends StatelessWidget {
  final String name;
  final bool loading;
  final void Function()? onTap;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;

  const IButton({
    Key? key,
    required this.name,
    required this.onTap,
    this.backgroundColor,
    this.loading = false,
    this.borderRadius,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onTap == null ? () {} : onTap,
        child: loading == false
            ? Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              )
            : CircularLoading(
                color: Colors.white,
                size: 15.height,
                lineWidth: 2.width,
              ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 45.height),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.radius),
            side: BorderSide.none,
          ),
          primary: onTap == null
              ? backgroundColor?.withOpacity(0.6) ??
                  Theme.of(context).primaryColor.withOpacity(0.6)
              : backgroundColor ?? Theme.of(context).primaryColor,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
