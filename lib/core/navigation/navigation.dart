import 'package:flutter/widgets.dart';
import 'package:intera/core/navigation/bindings/profile_binding.dart';
import '../../application/pages/_pages.dart';
import '../../core/navigation/routes.dart';
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
      name: Routes.LOGIN_WITH_EMAIL,
      page: () => LoginWithEmailPage(),
      binding: LoginWithEmailBinding(),
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
