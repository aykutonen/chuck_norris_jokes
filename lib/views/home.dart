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
          mainAxisSize: MainAxisSize.max,
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => ctrl.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : ctrl.hasJoke
                          ? Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(
                                child: Text(
                                  ctrl.joke.value!.content,
                                ),
                              ),
                            )
                          : Text("no jokes")),
                  ElevatedButton(
                    onPressed: () => ctrl.random(),
                    child: Text("Shuffle"),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.to(() => CategoriesView()),
                    child: Text("Categories"),
                  ),
                ],
              ),
            ),
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
