import 'package:get/get.dart';
import 'package:intera/domain/usecases/login_with_email.dart';
import 'package:intera/presentation/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginWithEmail>(() => LoginWithEmail(Get.find()));
    Get.lazyPut(
      () => LoginController(
        localStorage: Get.find(),
        loginWithEmail: Get.find(),
        dialogService: Get.find(),
      ),
    );
  }
}
