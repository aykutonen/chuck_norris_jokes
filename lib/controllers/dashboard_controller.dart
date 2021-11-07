import 'package:chuck_norris_jokes/views/categories.dart';
import 'package:chuck_norris_jokes/views/home.dart';
import 'package:chuck_norris_jokes/views/likes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentPageIndex = 0.obs;

  final pages = [
    HomeView(),
    CategoriesView(),
    LikesView(),
  ];

  Widget get currentPage => pages[currentPageIndex.value];
  String get pageTitle {
    switch (currentPageIndex.value) {
      case 0:
        return 'Home';
      case 1:
        return 'Categories';
      case 2:
        return 'Likes';
      default:
        return 'Home';
    }
  }

  void changePage(int index) => currentPageIndex(index);
}
