import 'dart:math';

import 'package:flutter/material.dart';

class ColorfulContainer extends StatelessWidget {
  const ColorfulContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.primaries[Random().nextInt(17)],);
  }
}