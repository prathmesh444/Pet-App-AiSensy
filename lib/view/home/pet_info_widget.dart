import 'package:flutter/material.dart';
import 'package:pet_app/data/models/pet.dart';
import 'package:pet_app/view/helper/colors/app_colors.dart';
import 'package:pet_app/view/helper/dimensions.dart';
import 'package:pet_app/view/helper/sized_box_extension.dart';
import 'package:pet_app/view/helper/strings/app_strings.dart';
import 'package:pet_app/view/helper/widgets/text.dart';

class PetInfo extends StatelessWidget {
  const PetInfo({super.key, required this.pet, this.isHistory = false});
  final Pet pet;
  final bool isHistory;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.pets, color: (pet.adopted && !isHistory) ? AppColors.greyColor:AppColors.purpleColor, size: 20,),
            PercentSizedBox.width(0.03),
            BuildText(
                text: pet.name,
                size: Dimensions.fontSize_20sp,
                weight: FontWeight.w700,
              color: (pet.adopted && !isHistory)? AppColors.greyColor: AppColors.purpleColor,
            ),
          ],
        ),
        PercentSizedBox.height(0.01),
        BuildText(text: "${AppString.kAge} : ${pet.age}"),
        BuildText(text: "${AppString.kColor} : ${pet.color}"),
      ],
    );
  }
}
