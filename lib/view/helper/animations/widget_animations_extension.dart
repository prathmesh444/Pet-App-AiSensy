import 'package:flutter/material.dart';
import 'fade_animation.dart';

extension WidgetExtension on Widget {
  Widget fadeAnimation(int delayInMilliseconds, {bool? animationDirectionUp}) {
    return FadeInAnimation(
      delay: delayInMilliseconds,
      animationDirectionUp: animationDirectionUp,
      child: this,
    );
  }
}