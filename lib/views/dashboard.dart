import 'package:chuck_norris_jokes/controllers/dashboard_controller.dart';
import 'package:chuck_norris_jokes/views/categories.dart';
import 'package:chuck_norris_jokes/views/home.dart';
import 'package:chuck_norris_jokes/views/likes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  final ctrl = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Obx(() => IndexedStack(
              // sizing: StackFit.expand,
              index: ctrl.currentPage.value,

              children: [
                HomeView(),
                CategoriesView(),
                LikesView(),
              ],
            )),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: ctrl.currentPage,
            currentIndex: ctrl.currentPage.value,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Likes'),
            ],
          )),
    );
  }
}
