import 'package:pet_app/view/helper/dimensions.dart';
import 'package:flutter/material.dart';

import 'colors/app_colors.dart';

class CustomTextStyle {
  static TextStyle defaultStyle({
    Dimensions? size,
    FontWeight? weight,
    Color? color,
    double? height,
    TextDecoration? textDecoration,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontSize: size?.value ?? 12.00,
      fontWeight: weight ?? FontWeight.w400,
      height: height,
      color: color ?? AppColors.blackColor,
      decoration: textDecoration,
      letterSpacing: letterSpacing,
    );
  }
}