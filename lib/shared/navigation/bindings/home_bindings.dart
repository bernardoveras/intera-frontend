import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:intera/presentation/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
