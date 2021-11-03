import 'package:chuck_norris_jokes/controllers/home_controller.dart';
import 'package:chuck_norris_jokes/views/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Chuck Norris Jokes"),
      ),
      body: SafeArea(
        child: Column(
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
            Obx(
              () => ctrl.likes.value.length > 0
                  ? SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: ctrl.likes.value.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              dense: true,
                              visualDensity: VisualDensity.compact,
                              title: Text(
                                  '${ctrl.likes.value[index].content.substring(0, 35)}...'),
                            );
                          }),
                    )
                  : SizedBox(),
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
                  onPressed: () => Get.to(() => CategoriesView(),
                      transition: Transition.cupertino),
                  child: Text("Categories"),
                ),
                ElevatedButton(
                  onPressed: () => ctrl.random(),
                  child: Text("Shuffle"),
                ),
                Obx(() => ElevatedButton(
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
                          Text("Like"),
                        ],
                      ),
                    )),
              ],
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => ctrl.random(),
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
