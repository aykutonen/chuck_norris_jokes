import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikesView extends StatelessWidget {
  final ctrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Jokes'),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView.separated(
            itemCount: ctrl.likeCount,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(ctrl.likes.value[index].content),
              );
            },
            separatorBuilder: (context, index) => Divider(thickness: 0.4),
          ),
        ),
      ),
    );
  }
}
