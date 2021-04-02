import 'package:flutter/widgets.dart';
import 'package:intera/application/navigation/bindings/profile_binding.dart';
import '../../application/pages/_pages.dart';
import '../../application/navigation/routes.dart';
import 'bindings/_bindings.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: Routes.CREATE_ACCOUNT,
      page: () => CreateAccountPage(),
      binding: CreateAccountBinding(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: Routes.LOGIN_WITH_EMAIL,
      page: () => LoginWithEmailPage(),
      binding: LoginWithEmailBinding(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => ResetPasswordPage(),
      binding: ResetPasswordBinding(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
  ];
}
