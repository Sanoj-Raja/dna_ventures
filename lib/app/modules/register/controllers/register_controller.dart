import 'package:dna_ventures/app/local_storage/sessions.dart';
import 'package:dna_ventures/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

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

  void register() {
    if (signupFormKey.currentState!.validate()) {
      SessionManager.saveUserToken('Login token saved.').then(
        (_) {
          Get.offAllNamed(Routes.HOME);
        },
      );
    }
  }

  void readTermsAndCondition() {
    print('Term & Condition Pressed.');
  }
}
