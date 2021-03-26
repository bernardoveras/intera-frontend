import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:intera/domain/usecases/logout.dart';
import 'package:intera/presentation/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILogout>(() => Logout(Get.find()));
    Get.lazyPut(() => HomeController(logout: Get.find()));
  }
}
