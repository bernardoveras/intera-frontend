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
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
