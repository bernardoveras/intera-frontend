import 'package:flutter/widgets.dart';
import 'package:intera/presentation/home/pages/profile/profile_page.dart';
import 'package:intera/shared/navigation/bindings/profile_binding.dart';

import '../../presentation/_pages.dart';
import '../../shared/navigation/routes.dart';
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
      name: Routes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
  ];
}
