import 'package:dna_ventures/app/constants/app_colors.dart';
import 'package:dna_ventures/app/constants/app_strings.dart';
import 'package:dna_ventures/app/widgets/body_top_bar.dart';
import 'package:dna_ventures/app/widgets/custom_buttons.dart';
import 'package:dna_ventures/app/widgets/gap_widget.dart';
import 'package:dna_ventures/app/widgets/menu_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyTopBar(
              alignLeft: true,
            ),
            VerticalGap(
              gap: 5,
            ),
            notification(),
            VerticalGap(
              gap: 15,
            ),
            Expanded(
              child: menus(),
            ),
          ],
        ),
      ),
    );
  }

  Obx notification() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.notifications,
              style: Get.textTheme.subtitle1!.copyWith(
                color: AppColors.white,
              ),
            ),
            FlutterSwitch(
              activeColor: AppColors.yellowHighlighter,
              inactiveColor: AppColors.darkGreySecondaryText,
              width: 38.0,
              height: 20.0,
              toggleSize: 18.0,
              value: controller.isNotificationEnable.value,
              padding: 1.5,
              onToggle: (val) {
                controller.isNotificationEnable.value = val;
              },
            ),
          ],
        ),
      ),
    );
  }

  menus() {
    return SingleChildScrollView(
      child: Column(
        children: [
          MenuOptionCard(
            heading: AppStrings.contactUs,
            subHeading: AppStrings.contactUsSubHeading,
            onTap: controller.contactUs,
          ),
          MenuOptionCard(
            heading: AppStrings.help,
            subHeading: AppStrings.helpSubHeading,
            onTap: controller.help,
          ),
          MenuOptionCard(
            heading: AppStrings.rateApp,
            subHeading: AppStrings.rateAppSubHeading,
            onTap: controller.rateApp,
          ),
          VerticalGap(
            gap: 15,
          ),
          LargeButton(
            buttonText: AppStrings.logout,
            onPressed: controller.logout,
          ),
          VerticalGap(
            gap: 15,
          ),
        ],
      ),
    );
  }
}
