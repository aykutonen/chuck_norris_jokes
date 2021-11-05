import 'package:chuck_norris_jokes/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final ctrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            padding: const EdgeInsets.all(32),
            alignment: Alignment.center,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Get.width / 3,
                  height: Get.width / 3,
                  child: Image.asset(
                    'assets/images/onboarding/01.jpg',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Text(
                  "Login",
                  style: Get.textTheme.headline3,
                ),
                SizedBox(height: 32),
                Form(
                  key: ctrl.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: ctrl.emailCtrl,
                        validator: ctrl.emailValidator,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'acme@mail.com',
                        ),
                      ),
                      TextFormField(
                        controller: ctrl.passwordCtrl,
                        validator: ctrl.passwordValidator,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: '***',
                        ),
                      ),
                      SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: ctrl.login,
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
