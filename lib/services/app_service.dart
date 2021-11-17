import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// Keys
final String _hasShowOnboardingKey = 'has_show_onboarding',
    _hasLoggedInKey = 'has_logged_in',
    _themeModeKey = 'theme_mode',
    _langKey = 'lang';

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

  void saveThemeMode(ThemeMode mode) {
    box.write(_themeModeKey, mode.index);
  }

  ThemeMode? getThemeMode() {
    if (box.hasData(_themeModeKey))
      return ThemeMode.values[box.read(_themeModeKey)];
  }

  void saveLanguage(String lang) {
    box.write(_langKey, lang);
  }

  String? getLanguage() => box.read(_langKey);
}
