import 'package:chuck_norris_jokes/controllers/category_controller.dart';
import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  final ctrl = Get.put(CategoryController());
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Obx(() => ListView.builder(
            itemCount: ctrl.count,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              return ListTile(
                  trailing: ctrl.selected.value.length > 0 &&
                          ctrl.selected.value == ctrl.categories.value[index]
                      ? Icon(Icons.check)
                      : null,
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
