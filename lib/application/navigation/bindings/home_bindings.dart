import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:intera/application/pages/home/home_controller.dart';
import 'package:intera/domain/usecases/logout.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILogout>(() => Logout(Get.find()));
    Get.lazyPut(() => HomeController(logout: Get.find()));
  }
}
