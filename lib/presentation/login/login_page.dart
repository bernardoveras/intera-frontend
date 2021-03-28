import 'package:animate_do/animate_do.dart';
import 'package:intera/presentation/login/components/form.dart';
import 'package:intera/presentation/login/login_controller.dart';
import 'package:intera/shared/components/circular_loading.dart';
import 'package:intera/shared/extensions/screen_util_extension.dart';
import 'components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                EdgeInsets.symmetric(horizontal: 30.width, vertical: 30.height),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn,
                      transform: Matrix4.translationValues(
                          0.0,
                          MediaQuery.of(context).viewInsets.bottom != 0
                              ? -40.0
                              : 0.0,
                          0.0),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.fastLinearToSlowEaseIn,
                        opacity: MediaQuery.of(context).viewInsets.bottom != 0
                            ? 0.0
                            : 1.0,
                        child: TitleComponent(),
                      ),
                    ),
                    Obx(
                      () => FadeInUp(
                        duration: Duration(milliseconds: 300),
                        delay: Duration(milliseconds: 700),
                        from: 30,
                        child: OutlinedButton(
                          onPressed: controller.loading.value == false
                              ? () async {
                                  // ToDo: Implementar a criação da conta
                                  print('Criar uma conta');
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
                LoginForm(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IButton extends StatelessWidget {
  final String title;
  final bool loading;
  final void Function()? onTap;
  final Color? backgroundColor;

  const IButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.loading = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.height,
      child: ElevatedButton(
        onPressed: onTap == null ? () {} : onTap,
        child: loading == false
            ? Text(
                title,
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
            borderRadius: BorderRadius.circular(8.radius),
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
