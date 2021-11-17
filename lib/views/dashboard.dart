import 'dart:ui';

import 'package:chuck_norris_jokes/controllers/app_controller.dart';
import 'package:chuck_norris_jokes/controllers/dashboard_controller.dart';
import 'package:chuck_norris_jokes/controllers/likes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  final ctrl = Get.put(DashboardController());
  final likeCtrl = Get.find<LikesController>();
  final appCtrl = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(ctrl.pageTitle)),
      ),
      body: SafeArea(
        child: Obx(() => ctrl.currentPage),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'menu'.tr,
                textAlign: TextAlign.end,
                style: Get.textTheme.headline4,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'theme_change'.tr,
                textAlign: TextAlign.end,
              ),
              onTap: () {
                appCtrl.changeThemeMode();
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'language_change'.tr,
                textAlign: TextAlign.end,
              ),
              onTap: () {
                appCtrl.changeLanguage();
                Get.back();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: ctrl.currentPageIndex,
          currentIndex: ctrl.currentPageIndex.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'.tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'categories'.tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'likes'.tr + ' (${likeCtrl.likeCount})'),
          ],
        ),
      ),
    );
  }
}
