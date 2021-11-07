import 'package:chuck_norris_jokes/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  final ctrl = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(ctrl.pageTitle)),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Obx(() => ctrl.currentPage),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: ctrl.currentPageIndex,
          currentIndex: ctrl.currentPageIndex.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Likes'),
          ],
        ),
      ),
    );
  }
}
