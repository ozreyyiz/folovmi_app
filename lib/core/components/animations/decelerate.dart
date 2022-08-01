import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class DecelerateAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  const DecelerateAnimation(
      {Key? key, required this.child, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      child: child,
      delay: duration,
      fadingDuration: Duration(milliseconds: 1000),
    );
  }
}
