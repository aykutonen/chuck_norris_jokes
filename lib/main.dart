import 'package:chuck_norris_jokes/controllers/app_controller.dart';
import 'package:chuck_norris_jokes/core/theme/theme.dart';
import 'package:chuck_norris_jokes/core/translations/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appInit();
  runApp(const MyApp());
}

Future<void> appInit() async {
  await GetStorage.init();
  // GetStorage().erase();
  Get.put(AppController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appCtrl = Get.find<AppController>();

    return GetMaterialApp(
      title: 'app_title'.tr,
      debugShowCheckedModeBanner: false,
      initialRoute: appCtrl.getInitialRoute(),
      getPages: AppRouter.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appCtrl.themeMode,
      translations: AppTranslations(),
      locale: appCtrl.language.value,
      fallbackLocale: Locale('en'),
    );
  }
}
