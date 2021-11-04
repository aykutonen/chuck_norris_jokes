import 'package:chuck_norris_jokes/controllers/app_controller.dart';
import 'package:chuck_norris_jokes/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  var pages = ["01.jpg", "02.jpg", "03.jpg", "04.jpg", "05.jpg"];
  var pageController = PageController();

  bool get isLast => currentPage.value == pages.length - 1;

  void nextPage() {
    if (isLast) {
      // pageController.animateToPage(0,
      //     duration: 300.milliseconds, curve: Curves.ease);
      Get.find<AppController>().saveHasShowOnboarding(true);
      Get.offAllNamed(AppRouter.home);
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }
}
