import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/core/base/view/base_view.dart';
import 'package:folovmi_app/core/components/box/height_box.dart';
import 'package:folovmi_app/core/components/box/width_box.dart';
import 'package:folovmi_app/core/components/container/colorful_container.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../../../core/constants/size/size_config.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/circle_gauge.dart';
import '../widgets/date_row.dart';

class BloodPressureFirst extends StatefulWidget {
  BloodPressureFirst({Key? key}) : super(key: key);

  @override
  State<BloodPressureFirst> createState() => _BloodPressureFirstState();
}

class _BloodPressureFirstState extends State<BloodPressureFirst> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      title: LocaleKeys.blood_pressure_blood_pressure,
      isShort: true,
      isMain: false,
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Padding(
        padding: PaddingConstants.generalPadding,
        child: SizedBox(
          height: SizeConfig.sizeHeight(context, 0.7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateRow(),
              CircleGauge(
                text: "120/80",
                containerSize: 200,
                fontSize: 40,
              ),
              _spo2Gauge(),
              _pulseGauge(),
            ],
          ),
        ),
      ),
    );
  }

  Column _pulseGauge() {
    return Column(
      children: [
        Row(
          children: [
            Texty(
              text: LocaleKeys.blood_pressure_pulse,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
          ],
        ),
        HeightBox(height: 10),
        Row(
          children: [
            Texty(
              text: LocaleKeys.blood_pressure_optimal,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(flex: 3),
            Texty(
              text: LocaleKeys.blood_pressure_normal,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(flex: 2),
            Texty(
              text: LocaleKeys.blood_pressure_pre_high,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(),
            Texty(
              text: LocaleKeys.blood_pressure_high,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(),
          ],
        ),
        SfLinearGauge(
          minimum: 70,
          maximum: 100,
          markerPointers: const [
            LinearShapePointer(
              value: 76,
              shapeType: LinearShapePointerType.invertedTriangle,
            ),
          ],
          ranges: <LinearGaugeRange>[
            LinearGaugeRange(
                startValue: 70,
                endValue: 80,
                color: ColorConstants.GREEN_LIGHT),
            LinearGaugeRange(
                startValue: 80, endValue: 89, color: ColorConstants.YELLOW),
            LinearGaugeRange(
                startValue: 89, endValue: 95, color: ColorConstants.PINK),
            LinearGaugeRange(
                startValue: 95, endValue: 100, color: ColorConstants.RED_LIGHT),
          ],
        ),
      ],
    );
  }

  Column _spo2Gauge() {
    return Column(
      children: [
        Row(
          children: [
            Texty(
              text: LocaleKeys.blood_pressure_spo2,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
          ],
        ),
        HeightBox(height: 10),
        Row(
          children: [
            Texty(
              text: LocaleKeys.blood_pressure_danger_hypoxemia,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(flex: 1),
            Texty(
              text: LocaleKeys.blood_pressure_low,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(flex: 2),
            Texty(
              text: LocaleKeys.blood_pressure_normal,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(),
          ],
        ),
        SfLinearGauge(
          minimum: 85,
          maximum: 100,
          markerPointers: const [
            LinearShapePointer(
              animationDuration: 3000,
              value: 98,
              shapeType: LinearShapePointerType.invertedTriangle,
            ),
          ],
          ranges: <LinearGaugeRange>[
            LinearGaugeRange(
                startValue: 85, endValue: 90, color: ColorConstants.PINK),
            LinearGaugeRange(
                startValue: 90, endValue: 95, color: ColorConstants.YELLOW),
            LinearGaugeRange(
                startValue: 95, endValue: 100, color: ColorConstants.BLUE),
          ],
        ),
      ],
    );
  }
}
