import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:chuck_norris_jokes/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikesView extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Jokes'),
      ),
      body: SafeArea(
        child: Obx(
          () => homeCtrl.likeCount > 0
              ? ListView.separated(
                  itemCount: homeCtrl.likeCount,
                  itemBuilder: (context, index) {
                    final joke = homeCtrl.likes.value[index];
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      key: Key(joke.id),
                      onDismissed: (_) => homeCtrl.removeLike(joke.id),
                      // direction: DismissDirection.endToStart,
                      child: ListTile(
                        title: Text(joke.content),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        onTap: () => Get.toNamed(AppRouter.likeDetail,
                            arguments: joke.id),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      Divider(thickness: 0.4, height: 0),
                )
              : Center(
                  child: Text('Chuck Norris has no jokes'),
                ),
        ),
      ),
    );
  }
}
