import 'package:chuck_norris_jokes/controllers/app_controller.dart';
import 'package:chuck_norris_jokes/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }

  String? emailValidator(String? val) {
    if (val != null && GetUtils.isEmail(val)) return null;
    return 'Lütfen geçerli bir eposta adresi girin';
  }

  String? passwordValidator(String? val) {
    if (val != null && val.isNotEmpty && val.length >= 3) return null;
    return 'Parola en az 3 karakter uzunluğunda olmalıdır.';
  }

  void login() {
    if (formKey.currentState!.validate()) {
      if (_checkUser()) {
        Get.find<AppController>().saveHasLoggedIn(true);
        Get.offAllNamed(AppRouter.home);
      } else {
        Get.snackbar('Hata', 'Hatalı parola girdiniz',
            backgroundColor: Colors.red,
            duration: 3.seconds,
            snackStyle: SnackStyle.FLOATING,
            snackPosition: SnackPosition.BOTTOM,
            icon: Icon(
              Icons.warning,
              color: Colors.white,
            ));
      }
    } else {
      passwordCtrl.clear();
    }
  }

  bool _checkUser() {
    print('text: ${passwordCtrl.text}');
    return passwordCtrl.text == '123';
  }
}
