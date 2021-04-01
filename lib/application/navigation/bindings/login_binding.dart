import 'package:get/get.dart';
import 'package:intera/application/pages/login/login_controller.dart';
import 'package:intera/application/pages/login/pages/login_with_email/login_with_email_controller.dart';
import 'package:intera/application/pages/login/pages/reset_password/reset_password_controller.dart';
import 'package:intera/domain/usecases/login_with_email.dart';
import 'package:intera/domain/usecases/login_with_google.dart';
import 'package:intera/domain/usecases/reset_password.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginWithGoogle>(() => LoginWithGoogle(Get.find()));
    Get.lazyPut(
      () => LoginController(
        localStorage: Get.find(),
        loginWithGoogle: Get.find(),
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

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IResetPassword>(() => ResetPassword(Get.find()));
    Get.lazyPut(() => ResetPasswordController(Get.find(), Get.find()));
  }
}
