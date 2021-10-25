import 'package:chuck_norris_jokes/controllers/category_controller.dart';
import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<CategoryController>();
    final homeCtrl = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Obx(() => ListView.builder(
            itemCount: ctrl.count,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(ctrl.categories.value[index]),
                  onTap: () {
                    homeCtrl.selectCategory(ctrl.categories.value[index]);
                    Get.back();
                  });
            })),
      ),
    );
  }
}
