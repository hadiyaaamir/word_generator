import 'package:flutter/material.dart';

class AnimatedSizer extends StatelessWidget {
  const AnimatedSizer({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      child: child,
    );
  }
}
