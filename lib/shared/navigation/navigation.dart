import 'package:get/get_navigation/get_navigation.dart';
import '../../presentation/_pages.dart';
import '../../shared/navigation/routes.dart';
import 'bindings/_bindings.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
