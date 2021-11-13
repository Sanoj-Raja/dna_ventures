import 'package:dna_ventures/app/constants/app_colors.dart';
import 'package:dna_ventures/app/constants/app_strings.dart';
import 'package:dna_ventures/app/widgets/body_top_bar.dart';
import 'package:dna_ventures/app/widgets/custom_buttons.dart';
import 'package:dna_ventures/app/widgets/gap_widget.dart';
import 'package:dna_ventures/app/widgets/user_details_card.dart';
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
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: Text(
                AppStrings.registeredUsers,
                style: Get.textTheme.headline1!.copyWith(
                  color: AppColors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.usersList.length,
                  itemBuilder: (context, index) {
                    return UserDetailsCard(
                      name: controller.usersList[index].name!,
                      email: controller.usersList[index].email!,
                      phoneNumber: controller.usersList[index].phoneNumber!,
                    );
                  },
                ),
              ),
            ),
            VerticalGap(
              gap: 20,
            ),
            LargeButton(
              buttonText: AppStrings.logout,
              onPressed: controller.logout,
            ),
            VerticalGap(
              gap: 20,
            ),
          ],
        ),
      ),
    );
  }
}
