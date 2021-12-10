import 'package:chuck_norris_jokes/controllers/likes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeDetailView extends StatelessWidget {
  final ctrl = Get.find<LikesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'joke_detail'.tr,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () {
                return ctrl.joke.value != null
                    ? Card(
                        child: ListTile(
                          leading: Image.network(ctrl.joke.value!.icon),
                          title: Text(ctrl.joke.value!.content),
                          contentPadding: EdgeInsets.all(16),
                        ),
                      )
                    : Container();
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: ctrl.likeUnlike,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() => Icon(
                        Icons.favorite,
                        size: 16,
                        color: ctrl.jokeIsLiked(ctrl.joke.value!.id)
                            ? Colors.red
                            : Colors.white,
                      )),
                  SizedBox(width: 8),
                  Text('like'.tr),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
