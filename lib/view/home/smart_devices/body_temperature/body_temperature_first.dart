import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/components/box/height_box.dart';
import '../../../../../core/components/text/texty.dart';
import '../../../../../core/constants/color/color_constants.dart';
import '../../../../../core/constants/padding/padding_constants.dart';
import '../../../../../core/constants/size/size_config.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/circle_gauge.dart';
import '../widgets/date_row.dart';

class BodyTemperatureFirst extends StatefulWidget {
  BodyTemperatureFirst({Key? key}) : super(key: key);

  @override
  State<BodyTemperatureFirst> createState() => _BodyTemperatureFirstState();
}

class _BodyTemperatureFirstState extends State<BodyTemperatureFirst> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      title: LocaleKeys.body_temperature_body_temperature,
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
                text: "36.4 C",
                containerSize: 200,
                fontSize: 40,
              ),
              _fever(),
            ],
          ),
        ),
      ),
    );
  }

  Column _fever() {
    return Column(
      children: [
        Row(
          children: [
            Texty(
              text: LocaleKeys.body_temperature_fever,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
          ],
        ),
        HeightBox(height: 10),
        Row(
          children: [
            Spacer(),
            Texty(
              text: LocaleKeys.body_temperature_normal,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(flex: 1),
            Texty(
              text: LocaleKeys.body_temperature_fever,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(flex: 1),
            Texty(
              text: LocaleKeys.body_temperature_high_fever,
              fontSize: 16,
              color: ColorConstants.BLUE_FONT,
            ),
            Spacer(),
          ],
        ),
        SfLinearGauge(
          minimum: 36,
          maximum: 41,
          markerPointers: const [
            LinearShapePointer(
              animationDuration: 3000,
              value: 36.4,
              shapeType: LinearShapePointerType.invertedTriangle,
            ),
          ],
          ranges: <LinearGaugeRange>[
            LinearGaugeRange(
                startValue: 36, endValue: 37.7, color: ColorConstants.LIGHTBLUE),
            LinearGaugeRange(
                startValue: 37.7, endValue: 39.4, color: ColorConstants.YELLOW),
            LinearGaugeRange(
                startValue: 39.4, endValue: 41, color: ColorConstants.PINK),
          ],
        ),
      ],
    );
  }
}
