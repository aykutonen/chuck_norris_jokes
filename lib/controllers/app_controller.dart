import 'package:chuck_norris_jokes/core/app_router.dart';
import 'package:chuck_norris_jokes/services/app_service.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var hasShowOnboarding = false.obs;
  var hasLoggedIn = false.obs;

  final service = Get.put(AppService());

  @override
  void onInit() {
    hasShowOnboarding(service.getHasShowOnboarding());
    hasLoggedIn(service.getHasLoggedIn());

    super.onInit();
  }

  void saveHasShowOnboarding(bool val) {
    service.saveHasShowOnboarding(val);
    hasShowOnboarding(val);
  }

  void saveHasLoggedIn(bool val) {
    service.saveHasLoggedIn(val);
    hasLoggedIn(val);
  }

  String getInitialRoute() {
    if (hasShowOnboarding.isTrue && hasLoggedIn.isTrue)
      return AppRouter.dashboard;
    if (hasShowOnboarding.isFalse) return AppRouter.onboarding;
    if (hasLoggedIn.isFalse) return AppRouter.login;
    return AppRouter.onboarding;
  }
}
