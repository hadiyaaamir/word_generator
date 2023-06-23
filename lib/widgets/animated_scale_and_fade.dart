import 'package:flutter/material.dart';

class AnimatedScaleAndFade extends StatelessWidget {
  const AnimatedScaleAndFade({
    super.key,
    required this.child,
    this.duration = 500,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: duration),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
