import 'package:dna_ventures/app/local_storage/sessions.dart';
import 'package:dna_ventures/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final phoneNumberTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void login() {
    if (loginFormKey.currentState!.validate()) {
      SessionManager.saveUserToken('Login token saved.').then(
        (_) {
          Get.offAllNamed(Routes.HOME);
        },
      );
    }
  }

  void registerNow() {
    Get.toNamed(Routes.REGISTER);
  }

  void forgotPassword() {
    print('Forgot password clicked.');
  }
}
