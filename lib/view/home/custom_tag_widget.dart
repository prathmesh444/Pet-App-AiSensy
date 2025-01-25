import 'package:flutter/material.dart';
import 'package:pet_app/view/helper/colors/app_colors.dart';
import 'package:pet_app/view/helper/dimensions.dart';
import 'package:pet_app/view/helper/font_styles.dart';
import 'package:pet_app/view/helper/padding_values.dart';
import 'package:pet_app/view/helper/strings/app_strings.dart';
import 'package:pet_app/view/helper/widgets/text.dart';

class CustomTag extends StatelessWidget {
  const CustomTag({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingValues.symmetric(horizontal: Dimensions.pad_8dp, vertical: Dimensions.pad_4dp),
      margin: PaddingValues.only(right: Dimensions.pad_8dp),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: BuildText(
        text: text,
        size: Dimensions.fontSize_12sp,
        color: color,
        weight: FontWeight.w500,
      ),
    );
  }
}
