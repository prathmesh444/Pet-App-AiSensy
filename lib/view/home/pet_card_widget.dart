import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:pet_app/controller/project_controler/route/route_navigation.dart';
import 'package:pet_app/controller/screen_controller/home/home_controller.dart';
import 'package:pet_app/data/models/pet.dart';
import 'package:pet_app/view/details/pet_detail_screen.dart';
import 'package:pet_app/view/helper/colors/app_colors.dart';
import 'package:pet_app/view/helper/dimensions.dart';
import 'package:pet_app/view/helper/padding_values.dart';
import 'package:pet_app/view/helper/sized_box_extension.dart';
import 'package:pet_app/view/helper/strings/app_strings.dart';
import 'package:pet_app/view/helper/widgets/button.dart';
import 'package:pet_app/view/home/custom_tag_widget.dart';

import 'pet_info_widget.dart';

class PetCard extends StatelessWidget {
  const PetCard({super.key, this.isHistory = false, required this.pet, required this.petIndex, required this.onTapCard});
  final Pet pet;
  final int petIndex;
  final Callback onTapCard;
  final bool isHistory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTapCard,
      child: Container(
        margin: PaddingValues.symmetric(horizontal: Dimensions.pad_12dp, vertical: Dimensions.pad_8dp),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: (pet.adopted && !isHistory) ? AppColors.greyColor.withOpacity(0.5) : AppColors.purpleColor.withOpacity(0.5), width: 1),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: pet.id,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: (pet.adopted && !isHistory) ? ColorFilter.mode(
                      Colors.grey,
                      BlendMode.saturation, // Apply grayscale effect
                    )
                        : ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.multiply, // Normal view
                    ),
                    image: AssetImage(pet.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14),
                  ),
                ),
              ),
            ),
            PetInfo(pet: pet, isHistory: isHistory,),
            Column(
              children: [
                CustomTag(text: pet.adopted ? AppString.kAdopted : AppString.kAvailable, color: (pet.adopted && !isHistory) ? AppColors.greyColor: AppColors.purpleColor),
                PercentSizedBox.height(0.015),
                CustomTag(text: "Price:- \$${pet.price.toStringAsFixed(0)}", color: (pet.adopted && !isHistory) ? AppColors.greyColor : AppColors.greenColor)
              ],
            ),
          ]
              )
      ),
    );
  }
}
