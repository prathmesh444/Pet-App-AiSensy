import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeInAnimation extends StatelessWidget {
  final int delay;
  final Widget child;
  final bool? animationDirectionUp;

  const FadeInAnimation({super.key, required this.delay, required this.child, this.animationDirectionUp});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween<double>(AniProps.opacity, Tween<double>(begin: 0.0, end: 1.0), duration: const Duration(milliseconds: 500))
      ..tween<double>(AniProps.translateY, Tween<double>(begin: animationDirectionUp == true ? 30.0 : -30.0, end: 0.0), duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: delay),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (_, Movie value, Widget? child) {
        return Opacity(
          opacity: value.get<double>(AniProps.opacity),
          child: Transform.translate(
            offset: Offset(0, value.get<double>(AniProps.translateY)),
            child: child,
          ),
        );
      },
    );
  }
}
