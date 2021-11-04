import 'package:chuck_norris_jokes/services/app_service.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var hasShowOnboarding = false.obs;

  final service = Get.put(AppService());

  @override
  void onInit() {
    hasShowOnboarding(service.getHasShowOnboarding());
    super.onInit();
  }

  void saveHasShowOnboarding(bool val) => service.saveHasShowOnboarding(val);
}
