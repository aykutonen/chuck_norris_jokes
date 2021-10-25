import 'package:chuck_norris_jokes/controllers/home_controller.dart';
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
      body: Center(
        child: Obx(() => ctrl.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ctrl.hasJoke
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(ctrl.joke.value!.content),
                  )
                : Text("no jokes")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ctrl.random(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
