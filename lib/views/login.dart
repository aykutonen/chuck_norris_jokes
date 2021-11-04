import 'package:chuck_norris_jokes/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final ctrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("hello Login"),
              ElevatedButton(
                onPressed: () => ctrl.login(),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
