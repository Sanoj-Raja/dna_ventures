import 'package:dna_ventures/app/constants/app_colors.dart';
import 'package:dna_ventures/app/constants/app_strings.dart';
import 'package:dna_ventures/app/widgets/gap_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsCard extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;

  const UserDetailsCard({
    Key? key,
    required this.name,
    required this.email,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkBlueBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${AppStrings.name}: $name',
                      style: Get.textTheme.headline2!.copyWith(
                        color: AppColors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              VerticalGap(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${AppStrings.mobileNumber}: $phoneNumber',
                      style: Get.textTheme.headline2!.copyWith(
                        color: AppColors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              VerticalGap(),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${AppStrings.email}: $email',
                      style: Get.textTheme.headline2!.copyWith(
                        color: AppColors.yellowButton,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
