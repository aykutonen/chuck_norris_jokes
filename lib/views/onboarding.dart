import 'package:chuck_norris_jokes/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  final ctrl = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView.builder(
                controller: ctrl.pageController,
                itemCount: ctrl.pages.length,
                onPageChanged: ctrl.currentPage,
                itemBuilder: (context, index) {
                  return Image.asset(
                    'assets/images/onboarding/${ctrl.pages[index]}',
                    fit: BoxFit.cover,
                  );
                }),
          ),
          Positioned(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                ctrl.pages.length,
                (index) => Obx(
                  () => Container(
                    margin: const EdgeInsets.all(4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: ctrl.currentPage.value == index
                          ? Colors.red
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            left: 16.0,
            bottom: 32.0,
          ),
          Positioned(
            right: 16,
            bottom: 32,
            child: ElevatedButton(
              child: Obx(() => Text(ctrl.isLast ? 'start'.tr : 'next'.tr)),
              onPressed: () => ctrl.nextPage(),
            ),
          ),
        ],
      ),
    );
  }
}
