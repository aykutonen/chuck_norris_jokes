import 'package:chuck_norris_jokes/core/app_router.dart';
import 'package:chuck_norris_jokes/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  var hasShowOnboarding = false.obs;
  var hasLoggedIn = false.obs;
  var themeMode = ThemeMode.system;
  var language = Get.deviceLocale.obs;

  final service = Get.put(AppService());

  @override
  void onInit() {
    hasShowOnboarding(service.getHasShowOnboarding());
    hasLoggedIn(service.getHasLoggedIn());

    // ThemeMode değerini storage'den çek
    final _themeModeFromLocal = service.getThemeMode();
    if (_themeModeFromLocal != null) themeMode = _themeModeFromLocal;

    final _langFromLocal = service.getLanguage();
    if (_langFromLocal != null && _langFromLocal.isNotEmpty) {
      language(Locale(_langFromLocal));
    }

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

  void changeThemeMode({ThemeMode? mode}) {
    if (mode == null) {
      mode = Get.isDarkMode ? ThemeMode.light : ThemeMode.dark;
    }
    service.saveThemeMode(mode);
    Get.changeThemeMode(mode);
  }

  void changeLanguage({String? lang}) {
    if (lang == null) {
      lang = language.value != null && language.value!.languageCode == 'en'
          ? 'tr'
          : 'en';
    }
    service.saveLanguage(lang);
    language(Locale(lang));
    Get.updateLocale(language.value!);
  }
}
