import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/core/base/view/base_view.dart';
import 'package:folovmi_app/core/components/box/height_box.dart';
import 'package:folovmi_app/core/components/container/colorful_container.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/border_radius/border_radius_constants.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';

import '../../../../../../core/init/lang/locale_keys.g.dart';
import 'ekg_page.dart';

class HealthMonitorMenuPage extends StatelessWidget {
  const HealthMonitorMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      title: LocaleKeys.health_monitor_health_monitor,
      isShort: true,
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Padding(
        padding: PaddingConstants.generalPadding,
        child: Container(
          height: SizeConfig.sizeHeight(context, 0.70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _healthMenuBigContainer(context, EKGPage()),
              _healthMenuSmallContainer(
                  context,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _healthMenuBox(
                        context: context,
                        child: Center(),
                        iconPath: "assets/images/blood_pressure.svg",
                        text: LocaleKeys.health_monitor_blood_pressure,
                      ),
                      _healthMenuBox(
                        context: context,
                        child: Center(),
                        iconPath: "assets/images/body_temperature.svg",
                        text: LocaleKeys.health_monitor_body_temperature,
                      ),
                    ],
                  )),
              _healthMenuSmallContainer(
                  context,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _healthMenuBox(
                        context: context,
                        child: Center(),
                        iconPath: "assets/images/spo2.svg",
                        text: LocaleKeys.health_monitor_spO2,
                      ),
                      _healthMenuBox(
                        context: context,
                        child: Center(),
                        iconPath: "assets/images/heart_rate.svg",
                        text: LocaleKeys.health_monitor_hearth_rate,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _healthMenuBox(
      {required BuildContext context,
      required Widget child,
      required String text,
      required String iconPath}) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => child)),
      child: Container(
        width: SizeConfig.sizeWidth(context, 0.43),
        decoration: BoxDecoration(
          color: ColorConstants.HEALTH_BLUE,
          borderRadius: BorderRadiusConstants.HEALTH_MENU_RADIUS,
        ),
        child: Padding(
          padding: PaddingConstants.generalPadding,
          child: Column(
            children: [
              Row(
                children: [
                  Texty(
                    text: text,
                    fontSize: 15,
                    color: ColorConstants.BLUE_FONT,
                  ),
                ],
              ),
              HeightBox(height: 20),
              SvgPicture.asset(iconPath),
              HeightBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _healthMenuBigContainer(BuildContext context, Widget child) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => child)),
      child: Container(
        width: double.infinity,
        height: SizeConfig.sizeHeight(context, 0.20),
        decoration: BoxDecoration(
          color: ColorConstants.HEALTH_BLUE,
          borderRadius: BorderRadiusConstants.HEALTH_MENU_BIG_RADIUS,
        ),
        child: Padding(
          padding: PaddingConstants.generalPadding,
          child: Column(
            children: [
              HeightBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: SvgPicture.asset(
                      "assets/images/ekg.svg",
                      width: SizeConfig.sizeWidth(context, 0.7),
                    ),
                  ),
                ],
              ),
              HeightBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/images/lung.svg"),
                  Texty(
                    text: LocaleKeys.health_monitor_ekg_respiratory,
                    fontSize: 18,
                    color: ColorConstants.BLUE_FONT,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container _healthMenuSmallContainer(BuildContext context, Widget child) {
  return Container(
    width: double.infinity,
    height: SizeConfig.sizeHeight(context, 0.20),
    child: child,
  );
}
