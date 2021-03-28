import 'package:get/get.dart';
import 'package:intera/data/repositories/profile_repository.dart';
import 'package:intera/domain/repositories/profile_repository.dart';
import 'package:intera/presentation/home/pages/profile/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProfileRepository>(() => ProfileRepository());
    Get.lazyPut(() => ProfileController(Get.find(), Get.find()));
  }
}
