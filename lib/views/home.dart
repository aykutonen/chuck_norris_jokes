import 'package:chuck_norris_jokes/controllers/category_controller.dart';
import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:chuck_norris_jokes/controllers/likes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final ctrl = Get.put(HomeController());
  final catCtrl = Get.find<CategoryController>();
  final likeCtrl = Get.put(LikesController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => catCtrl.selected.isNotEmpty
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('selected_category'.tr + ': ${catCtrl.selected}'),
                    IconButton(
                      onPressed: () => catCtrl.selectCategory(''),
                      icon: const Icon(Icons.delete),
                    )
                  ],
                )
              : Container(),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Obx(() => ctrl.isLoading.value
                  ? CircularProgressIndicator()
                  : ctrl.hasJoke
                      ? Text(
                          ctrl.joke.value!.content,
                          style: Get.textTheme.headline4,
                        )
                      : Text('no_jokes'.tr)),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => ctrl.random(),
              icon: Icon(
                Icons.shuffle,
                size: 32,
              ),
            ),
            Obx(
              () => IconButton(
                onPressed: () => likeCtrl.jokeIsLiked(ctrl.joke.value!.id)
                    ? likeCtrl.removeLike(ctrl.joke.value!.id)
                    : likeCtrl.addLike(ctrl.joke.value!),
                icon: Icon(
                  Icons.favorite,
                  size: 32,
                  color:
                      ctrl.hasJoke && likeCtrl.jokeIsLiked(ctrl.joke.value!.id)
                          ? Colors.red
                          : null,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
