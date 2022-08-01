import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../core/components/text/texty.dart';
import '../../../../../core/constants/color/color_constants.dart';

class CircleGauge extends StatelessWidget {
  final double fontSize;
  final String text;
  final double containerSize;
  const CircleGauge({
    Key? key,
    required this.text,
    required this.containerSize, required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerSize,
      child: Stack(
        children: [
          SfRadialGauge(
            axes: [
              RadialAxis(
                showLabels: false,
                showAxisLine: true,
                showTicks: false,
                startAngle: 170,
                endAngle: 170,
                axisLineStyle: AxisLineStyle(
                  thickness: 1,
                  color: ColorConstants.BLUE,
                ),
                pointers: [
                  RangePointer(
                    value: 30,
                    width: 0.12,
                    color: ColorConstants.BLUE,
                    pointerOffset: -0.05,
                    cornerStyle: CornerStyle.bothCurve,
                    sizeUnit: GaugeSizeUnit.factor,
                  )
                ],
              ),
            ],
          ),
          Container(
            height: containerSize,
            child: Center(
              child: Texty(
                text: text,
                fontSize: fontSize,
                color: ColorConstants.BLACK,
              ),
            ),
          )
        ],
      ),
    );
  }
}
