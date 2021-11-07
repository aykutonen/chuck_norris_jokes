import 'package:chuck_norris_jokes/controllers/app_controller.dart';
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
                    Text("Selected Category: ${catCtrl.selected}"),
                    IconButton(
                      onPressed: () => catCtrl.selectCategory(''),
                      icon: const Icon(Icons.delete),
                    )
                  ],
                )
              : Container(),
        ),
        Container(
          padding: const EdgeInsets.all(32),
          child: ElevatedButton(
            child: Text(
              'Theme Change',
            ),
            onPressed: () {
              final appCtrl = Get.find<AppController>();
              Get.isDarkMode
                  ? appCtrl.changeThemeMode(ThemeMode.light)
                  : appCtrl.changeThemeMode(ThemeMode.dark);
            },
          ),
        ),
        Container(
          height: Get.height / 4,
          padding: const EdgeInsets.all(24),
          alignment: Alignment.center,
          child: Obx(() => ctrl.isLoading.value
              ? CircularProgressIndicator()
              : ctrl.hasJoke
                  ? Text(ctrl.joke.value!.content)
                  : Text("no jokes")),
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
        // SizedBox(height: 32),
      ],
    );
  }
}
