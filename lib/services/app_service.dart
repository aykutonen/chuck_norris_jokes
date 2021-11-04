import 'package:get_storage/get_storage.dart';

final String hasShowOnboardingKey = 'has_show_onboarding',
    hasLoggedInKey = 'has_logged_in';

class AppService {
  final box = GetStorage();

  void saveHasShowOnboarding(bool val) {
    box.write(hasShowOnboardingKey, val);
  }

  bool getHasShowOnboarding() => box.read<bool?>(hasShowOnboardingKey) ?? false;

  void saveHasLoggedIn(bool val) {
    box.write(hasLoggedInKey, val);
  }

  bool getHasLoggedIn() => box.read<bool?>(hasLoggedInKey) ?? false;
}
