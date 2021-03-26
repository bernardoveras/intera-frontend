import 'package:get/get.dart';
import 'package:intera/presentation/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(localStorage: Get.find()));
  }
}
