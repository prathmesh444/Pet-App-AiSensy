import 'package:pet_app/view/helper/dimensions.dart';
import 'package:pet_app/view/helper/font_styles.dart';
import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  const BuildText({
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.size,
    this.weight,
    this.color,
    this.maxLines,
    super.key
  });

  final String text;
  final Dimensions? size;
  final Color? color;
  final TextStyle? style;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? CustomTextStyle.defaultStyle(
        size: size,
        color: color,
        weight: weight
      ),
      textAlign: textAlign ?? TextAlign.start,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
