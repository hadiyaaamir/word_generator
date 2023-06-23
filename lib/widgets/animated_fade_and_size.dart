import 'package:flutter/material.dart';

class AnimatedFadeAndSize extends StatelessWidget {
  const AnimatedFadeAndSize({
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
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
