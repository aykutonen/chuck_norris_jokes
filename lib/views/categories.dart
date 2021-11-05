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
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.separated(
            itemCount: ctrl.count,
            itemBuilder: (context, index) {
              final cat = ctrl.categories.value[index];
              final selectedCat = ctrl.selected.value;
              return ListTile(
                trailing: selectedCat.length > 0 && selectedCat == cat
                    ? Icon(Icons.check)
                    : null,
                title: Text(cat),
                onTap: () {
                  homeCtrl.selectCategory(cat);
                  Get.back();
                },
              );
            },
            separatorBuilder: (context, index) =>
                Divider(height: 2, thickness: 0.4),
          ),
        ),
      ),
    );
  }
}
