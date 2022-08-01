import 'package:flutter/material.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/border_radius/border_radius_constants.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/view/home/smart_devices/widgets/date_row.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/size/size_config.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../widgets/circle_gauge.dart';

class BodyTemperatureSecond extends StatefulWidget {
  BodyTemperatureSecond({Key? key}) : super(key: key);

  @override
  State<BodyTemperatureSecond> createState() => _BodyTemperatureSecondState();
}

class _BodyTemperatureSecondState extends State<BodyTemperatureSecond> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      title: LocaleKeys.smart_devices,
      isShort: true,
      isMain: false,
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Padding(
        padding: PaddingConstants.generalPadding,
        child: SizedBox(
          height: SizeConfig.sizeHeight(context, 0.7),
          child: Column(
            children: [
              DateRow(),
              CircleGauge(
                text: "120/80",
                containerSize: 150,
                fontSize: 30,
              ),
              Texty(
                text: LocaleKeys.body_temperature_body_temperature,
                fontSize: 14,
                color: ColorConstants.BLUE_FONT,
              ),
              Container(
                height: SizeConfig.sizeHeight(context, 0.32),
                width: SizeConfig.sizeWidth(context, 0.4),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadiusConstants.HEALTH_MENU_RADIUS,
                ),
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.sizeHeight(context, 0.08),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusConstants
                            .BODY_TEMPERATURE_CONTAINER_TOP,
                        color: ColorConstants.LIGHTBLUE,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Texty(
                              text: LocaleKeys.body_temperature_otpimal,
                              fontSize: 14,
                              color: ColorConstants.WHITE,
                            ),
                            Texty(
                              text: "80",
                              fontSize: 14,
                              color: ColorConstants.WHITE,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.sizeHeight(context, 0.08),
                      width: double.infinity,
                      color: ColorConstants.YELLOW,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Texty(
                              text: LocaleKeys.body_temperature_normal,
                              fontSize: 14,
                              color: ColorConstants.WHITE,
                            ),
                            Texty(
                              text: "89",
                              fontSize: 14,
                              color: ColorConstants.WHITE,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.sizeHeight(context, 0.08),
                      width: double.infinity,
                      color: ColorConstants.PINK,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Texty(
                              text: LocaleKeys.body_temperature_pre_high,
                              fontSize: 14,
                              color: ColorConstants.WHITE,
                            ),
                            Texty(
                              text: "95",
                              fontSize: 14,
                              color: ColorConstants.WHITE,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: SizeConfig.sizeHeight(context, 0.08),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorConstants.RED_LIGHT,
                        borderRadius: BorderRadiusConstants
                            .BODY_TEMPERATURE_CONTAINER_BOTTOM,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Texty(
                              text: LocaleKeys.body_temperature_high,
                              fontSize: 14,
                              color: ColorConstants.WHITE,
                            ),
                            Texty(
                              text: "95",
                              fontSize: 14,
                              color: ColorConstants.WHITE,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
