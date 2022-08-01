import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class EasyInOutAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  const EasyInOutAnimation({Key? key, required this.child, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      slidingBeginOffset: const Offset(0.0, 0.0),
      fadingDuration: const Duration(milliseconds: 2000),
      delay: duration,
      slidingCurve: Curves.easeInOut,
      child: child,
    );
  }
}

