import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final ctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => ctrl.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ctrl.hasJoke
                    ? Center(
                        child: Text(ctrl.joke.value!.content),
                      )
                    : Text("no jokes")),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => ctrl.random(),
              child: Text("Shuffle"),
            ),
            Obx(
              () => ElevatedButton(
                onPressed: () => ctrl.jokeIsLiked
                    ? ctrl.removeLike(ctrl.joke.value!.id)
                    : ctrl.addLike(ctrl.joke.value!),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 16,
                      color: ctrl.jokeIsLiked ? Colors.red : Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text("Like ${ctrl.likeCount > 0 ? ctrl.likeCount : ''}"),
                  ],
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
