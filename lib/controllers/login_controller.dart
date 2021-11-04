import 'package:chuck_norris_jokes/controllers/app_controller.dart';
import 'package:chuck_norris_jokes/core/app_router.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  void login() {
    Get.find<AppController>().saveHasLoggedIn(true);
    Get.offAllNamed(AppRouter.home);
  }
}
