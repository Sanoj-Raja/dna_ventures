import 'package:dna_ventures/app/constants/app_colors.dart';
import 'package:dna_ventures/app/constants/app_errors.dart';
import 'package:dna_ventures/app/local_storage/sessions.dart';
import 'package:dna_ventures/app/models/user_model.dart';
import 'package:dna_ventures/app/routes/app_pages.dart';
import 'package:dna_ventures/app/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();
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

  void register() {
    if (signupFormKey.currentState!.validate()) {
      databaseHelper
          .registerUser(
        UserModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          phoneNumber: phoneNumberController.text,
        ),
      )
          .then(
        (isUserRegistered) {
          if(isUserRegistered) { 
          SessionManager.saveUserToken('Login token saved.').then(
            (_) {
              Get.offAllNamed(Routes.HOME);
            },
          );
          } else {
             Get.snackbar(
              AppErrors.userAlreadyExists,
              AppErrors.userAlreadyExistsDetails,
              backgroundColor: AppColors.white,
            );
          
          }
        }
      );
    }
  }

  void readTermsAndCondition() {
    print('Term & Condition Pressed.');
  }
}
