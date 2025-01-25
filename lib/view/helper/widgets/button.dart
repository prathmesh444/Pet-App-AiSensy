import 'package:pet_app/view/helper/colors/app_colors.dart';
import 'package:pet_app/view/helper/dimensions.dart';
import 'package:pet_app/view/helper/font_styles.dart';
import 'package:pet_app/view/helper/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BtnCustom extends StatelessWidget {
  const BtnCustom({
    super.key,
    this.btnColor,
    this.titleSize,
    this.titleColor,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.linearGradient,
    this.titleWidget,
    this.title,
    required this.onPress
  });

  final Color? btnColor;
  final double? titleSize;
  final Color? titleColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final BoxBorder? border;
  final BoxShadow? boxShadow;
  final LinearGradient? linearGradient;
  final Widget? titleWidget;
  final String? title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        HapticFeedback.heavyImpact();
        onPress();
      },
      child: AnimatedContainer(
        curve: Curves.linearToEaseOut,
        duration: const Duration(milliseconds: 50),
        alignment: Alignment.center,
        width: width ?? Get.width * 0.95,
        height: height ?? 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 44.0)),
            color: btnColor ?? AppColors.purpleColor,
            border: border,

        ),
        // margin: EdgeInsets.all(25),
        child: titleWidget
            ?? BuildText(
              text: title ?? "",
                size: Dimensions.fontSize_16sp,
              color: titleColor ?? AppColors.whiteColor,
              )
      ),
    );
  }
}
