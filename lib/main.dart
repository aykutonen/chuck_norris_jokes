import 'package:chuck_norris_jokes/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appInit();
  runApp(MyApp());
}

Future<void> appInit() async {
  await GetStorage.init();
  // GetStorage().erase();
  Get.put(AppController());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Get.find<AppController>().getInitialRoute(),
      getPages: AppRouter.routes,
    );
  }
}
