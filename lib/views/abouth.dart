import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final homeCtrl = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(
          //   child: Obx(
          //     () => Text(homeCtrl.count.toString()),
          //   ),
          // ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () => {},
            child: Text("incrase"),
          ),
        ],
      ),
    );
  }
}
