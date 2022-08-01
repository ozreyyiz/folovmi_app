import 'package:flutter/material.dart';


class FirstPageCircle extends StatelessWidget {
  const FirstPageCircle({
    Key? key,
    required this.size, required this.heightWidth, required this.color,
  }) : super(key: key);

  final Size size;
  final double heightWidth;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: heightWidth,
      height: heightWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:color,
      ),
    );
  }
}