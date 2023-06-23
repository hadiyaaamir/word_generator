import 'package:flutter/material.dart';

class AnimatedFader extends StatelessWidget {
  const AnimatedFader({
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
      child: child,
    );
  }
}
