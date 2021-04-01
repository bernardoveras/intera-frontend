import 'package:get/get.dart';
import 'package:intera/domain/usecases/login_with_email.dart';
import 'package:intera/presentation/login/login_controller.dart';
import 'package:intera/presentation/login/pages/login_with_email/login_with_email_controller.dart';

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
class LoginWithEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginWithEmail>(() => LoginWithEmail(Get.find()));
    Get.lazyPut(
      () => LoginWithEmailController(
        localStorage: Get.find(),
        loginWithEmail: Get.find(),
        dialogService: Get.find(),
      ),
    );
  }
}

