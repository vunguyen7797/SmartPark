import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum Fading { opacity, translateX, translateY }

class CustomFadeIn extends StatelessWidget {
  final double delay;
  final Widget child;
  final bool transform;
  final transformBegin;
  final opacityDuration;
  final transformDuration;
  final slide;

  CustomFadeIn(
      {this.delay,
      this.child,
      this.transform,
      this.transformBegin,
      this.transformDuration,
      this.opacityDuration,
      this.slide});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<Fading>()
      ..add(
          Fading.opacity,
          Tween(begin: 0.0, end: 1.0),
          Duration(
              milliseconds: opacityDuration == null ? 500 : opacityDuration))
      ..add(
          Fading.translateX,
          Tween(
              begin: transformBegin != null ? transformBegin : 130.0, end: 0.0),
          Duration(
              milliseconds:
                  transformDuration == null ? 500 : transformDuration),
          Curves.easeOut);

    return PlayAnimation<MultiTweenValues<Fading>>(
      delay: Duration(milliseconds: (300 * delay).round()),
      tween: tween,
      duration: tween.duration,
      child: child,
      builder: (context, child, value) {
        return Opacity(
          opacity: value.get(Fading.opacity),
          child: Transform.translate(
            offset: transform == false || transform == null
                ? Offset(0, value.get(Fading.translateX))
                : Offset(value.get(Fading.translateX), 0),
            child: child,
          ),
        );
      },
    );
  }
}
