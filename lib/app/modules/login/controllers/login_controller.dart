import 'package:bot_toast/bot_toast.dart';
import 'package:dna_ventures/app/constants/app_colors.dart';
import 'package:dna_ventures/app/constants/app_errors.dart';
import 'package:dna_ventures/app/constants/app_strings.dart';
import 'package:dna_ventures/app/local_storage/sessions.dart';
import 'package:dna_ventures/app/routes/app_pages.dart';
import 'package:dna_ventures/app/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final phoneNumberTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  final databaseHelper = Get.find<DataBaseHelper>();

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
      databaseHelper
          .loginUser(
        phoneNumberTextController.text,
        passwordTextController.text,
      )
          .then(
        (userData) {
          if (userData != null) {
            SessionManager.saveUserToken('Login token saved.').then(
              (_) {
                Get.offAllNamed(Routes.HOME);
              },
            );
          } else {
            Get.snackbar(
              AppErrors.invalidCredentials,
              AppErrors.invalidPhoneNumberOrPassword,
              backgroundColor: AppColors.white,
            );
          }
        },
      );
    }
  }

  void registerNow() {
    Get.toNamed(Routes.REGISTER);
  }

  void forgotPassword() {
    BotToast.showText(text: AppStrings.notAvailableNow);
    print('Forgot password clicked.');
  }
}
