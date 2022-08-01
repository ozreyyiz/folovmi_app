import 'package:flutter/material.dart';
import 'package:folovmi_app/core/components/box/height_box.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/border_radius/border_radius_constants.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';
import 'package:folovmi_app/core/init/extension/string_extension.dart';


import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/circle_gauge.dart';
import '../widgets/date_row.dart';

class BloodPressureSecond extends StatefulWidget {
  BloodPressureSecond({Key? key}) : super(key: key);

  @override
  State<BloodPressureSecond> createState() => _BloodPressureSecondState();
}

class _BloodPressureSecondState extends State<BloodPressureSecond> {
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DateRow(),
              CircleGauge(
                text: "120/80",
                containerSize: 150,
                fontSize: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _systolicGauge(context),
                  _diastolicGauge(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _diastolicGauge(BuildContext context) {
    return Column(
      children: [
        Texty(
          text: LocaleKeys.blood_pressure_systolic,
          fontSize: 14,
          color: ColorConstants.BLUE_FONT,
        ),
        HeightBox(height: 10),
        Container(
          height: SizeConfig.sizeHeight(context, 0.35),
          width: SizeConfig.sizeWidth(context, 0.4),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusConstants.BLOOD_PRESSURE_CONTAINER_RADIUS,
            gradient: LinearGradient(
              colors: [
                ColorConstants.LIGHTBLUE,
                ColorConstants.YELLOW,
                ColorConstants.PINK,
                ColorConstants.RED_LIGHT,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _levelText(
                LocaleKeys.blood_pressure_normal,
                LocaleKeys.blood_pressure_80,
              ),
              _levelText(
                LocaleKeys.blood_pressure_low,
                LocaleKeys.blood_pressure_89,
              ),
              _levelText(
                LocaleKeys.blood_pressure_pre_high,
                LocaleKeys.blood_pressure_95,
              ),
              _levelText(
                LocaleKeys.blood_pressure_high,
                LocaleKeys.blood_pressure_95,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _systolicGauge(BuildContext context) {
    return Column(
      children: [
        Texty(
          text: LocaleKeys.blood_pressure_systolic,
          fontSize: 14,
          color: ColorConstants.BLUE_FONT,
        ),
        HeightBox(height: 10),
        Container(
          height: SizeConfig.sizeHeight(context, 0.35),
          width: SizeConfig.sizeWidth(context, 0.4),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusConstants.BLOOD_PRESSURE_CONTAINER_RADIUS,
            gradient: LinearGradient(
              colors: [
                ColorConstants.LIGHTBLUE,
                ColorConstants.YELLOW,
                ColorConstants.PINK,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _levelText(
                LocaleKeys.blood_pressure_normal,
                LocaleKeys.blood_pressure_80,
              ),
              _levelText(
                LocaleKeys.blood_pressure_low,
                LocaleKeys.blood_pressure_89,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        LocaleKeys.blood_pressure_danger.locale,
                        style: TextStyle(
                          color: ColorConstants.WHITE,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Texty(
                        text: LocaleKeys.blood_pressure_hypoxemia,
                        fontSize: 14,
                        color: ColorConstants.WHITE,
                      ),
                    ],
                  ),
                  Texty(
                    text: LocaleKeys.blood_pressure_95,
                    fontSize: 14,
                    color: ColorConstants.WHITE,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _levelText(String levelText, String levelAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Texty(
          text: levelText,
          fontSize: 14,
          color: ColorConstants.WHITE,
        ),
        Texty(
          text: levelAmount,
          fontSize: 14,
          color: ColorConstants.WHITE,
        ),
      ],
    );
  }
}
