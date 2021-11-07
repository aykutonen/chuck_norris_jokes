import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final ctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => ctrl.selectedCategory.isNotEmpty
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Selected Category: ${ctrl.selectedCategory}"),
                    IconButton(
                      onPressed: () => ctrl.selectCategory(""),
                      icon: const Icon(Icons.delete),
                    )
                  ],
                )
              : Container(),
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
                color: Colors.green,
              ),
            ),
            Obx(
              () => IconButton(
                onPressed: () => ctrl.jokeIsLiked
                    ? ctrl.removeLike(ctrl.joke.value!.id)
                    : ctrl.addLike(ctrl.joke.value!),
                icon: Icon(
                  Icons.favorite,
                  size: 32,
                  color: ctrl.jokeIsLiked ? Colors.red : Colors.grey.shade400,
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
