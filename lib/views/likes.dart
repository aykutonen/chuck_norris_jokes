import 'package:chuck_norris_jokes/controllers/likes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikesView extends StatelessWidget {
  final ctrl = Get.find<LikesController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ctrl.likeCount > 0
          ? ListView.separated(
              itemCount: ctrl.likeCount,
              itemBuilder: (context, index) {
                final joke = ctrl.likes.value[index];
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  key: Key(joke.id),
                  onDismissed: (_) => ctrl.removeLike(joke.id),
                  // direction: DismissDirection.endToStart,
                  child: ListTile(
                    title: Text(
                      joke.content,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    onTap: () => ctrl.openDetail(joke.id),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  Divider(thickness: 0.4, height: 0),
            )
          : Center(
              child: Text('joke_not_found'.tr),
            ),
    );
  }
}
