import 'package:dna_ventures/app/constants/app_strings.dart';
import 'package:dna_ventures/app/widgets/body_top_bar.dart';
import 'package:dna_ventures/app/widgets/custom_buttons.dart';
import 'package:dna_ventures/app/widgets/gap_widget.dart';
import 'package:dna_ventures/app/widgets/menu_option_card.dart';
import 'package:flutter/material.dart';
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
            Expanded(
              child: menus(),
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
