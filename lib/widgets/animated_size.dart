import 'package:flutter/material.dart';

class AnimatedSizer extends StatelessWidget {
  const AnimatedSizer({
    super.key,
    required this.child,
    this.duration = 500,
  });

  final Widget child;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}
