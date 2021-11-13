import 'package:dna_ventures/app/constants/app_errors.dart';
import 'package:dna_ventures/app/utils/text_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dna_ventures/app/constants/app_colors.dart';
import 'package:dna_ventures/app/constants/app_strings.dart';
import 'package:dna_ventures/app/widgets/body_top_bar.dart';
import 'package:dna_ventures/app/widgets/custom_buttons.dart';
import 'package:dna_ventures/app/widgets/gap_widget.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: LargeButton(
        buttonText: AppStrings.register,
        onPressed: controller.register,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BodyTopBar(),
            VerticalGap(
              gap: 30,
            ),
            Text(
              AppStrings.register,
              style: Get.textTheme.headline1,
            ),
            Expanded(child: registerForm()),
          ],
        ),
      ),
    );
  }

  Widget registerForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: SingleChildScrollView(
        child: Form(
          key: controller.signupFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.name,
                style: Get.textTheme.subtitle1!.copyWith(
                  color: AppColors.white,
                ),
              ),
              VerticalGap(),
              UniversalTextField(
                controller: controller.nameController,
                keyboardType: TextInputType.name,
                hintText: AppStrings.name,
                validatorErrorText: AppErrors.nameErrorText,
              ),
              VerticalGap(
                gap: 20,
              ),
              Text(
                AppStrings.mobileNumber,
                style: Get.textTheme.subtitle1!.copyWith(
                  color: AppColors.white,
                ),
              ),
              VerticalGap(),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * .15,
                      child: CountryCodeTextField(),
                    ),
                    Expanded(
                      child: PhoneTextField(
                        controller: controller.phoneNumberController,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalGap(
                gap: 20,
              ),
              Text(
                AppStrings.email,
                style: Get.textTheme.subtitle1!.copyWith(
                  color: AppColors.white,
                ),
              ),
              VerticalGap(),
              EmailTextField(
                controller: controller.emailController,
              ),
              VerticalGap(
                gap: 20,
              ),
              Text(
                AppStrings.password,
                style: Get.textTheme.subtitle1!.copyWith(
                  color: AppColors.white,
                ),
              ),
              VerticalGap(),
              PasswordTextField(
                controller: controller.passwordController,
                hintText: AppStrings.password,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 20,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: AppStrings.byTappingIAgree,
                        style: Get.textTheme.headline2,
                      ),
                      TextSpan(
                        text: AppStrings.termsAndCondition,
                        style: Get.textTheme.headline2!.copyWith(
                          color: AppColors.purple,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = controller.readTermsAndCondition,
                      ),
                    ],
                  ),
                ),
              ),
              VerticalGap(
                gap: Get.height * .4,
              )
            ],
          ),
        ),
      ),
    );
  }
}
