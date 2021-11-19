import 'package:chuck_norris_jokes/controllers/category_controller.dart';
import 'package:chuck_norris_jokes/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  final ctrl = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.count(
        semanticChildCount: ctrl.count,
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        padding: const EdgeInsets.all(16),
        children: List.generate(
          ctrl.count,
          (index) {
            final cat = ctrl.categories.value[index];
            final isSelected = ctrl.selected.value == cat;

            return GestureDetector(
                onTap: () => ctrl.selectCategory(cat),
                child: Container(
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border.all(width: 2, color: AppColors.secondary)
                        : Border.all(color: AppColors.onSecondary),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/categories/$cat.jpg'),
                        fit: BoxFit.cover),
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    color: isSelected
                        ? AppColors.secondary.withOpacity(0.75)
                        : Colors.black45,
                    child: Text(
                      cat,
                      style: Get.textTheme.headline5,
                    ),
                  ),
                ));
          },
          growable: false,
        ),
      ),
    );
  }
}
