import 'package:get_storage/get_storage.dart';

// Keys
final String _hasShowOnboardingKey = 'has_show_onboarding',
    _hasLoggedInKey = 'has_logged_in';

class AppService {
  final box = GetStorage();

  void saveHasShowOnboarding(bool val) {
    box.write(_hasShowOnboardingKey, val);
  }

  bool getHasShowOnboarding() =>
      box.read<bool?>(_hasShowOnboardingKey) ?? false;

  void saveHasLoggedIn(bool val) {
    box.write(_hasLoggedInKey, val);
  }

  bool getHasLoggedIn() => box.read<bool?>(_hasLoggedInKey) ?? false;
}
