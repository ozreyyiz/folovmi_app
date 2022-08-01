import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folovmi_app/core/base/view/base_view.dart';
import 'package:folovmi_app/core/components/box/height_box.dart';
import 'package:folovmi_app/core/components/box/width_box.dart';
import 'package:folovmi_app/core/components/input/standart_input_box.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';

import '../../../../../../core/init/lang/locale_keys.g.dart';

class HealthMonitorSettingsPage extends ConsumerStatefulWidget {
  const HealthMonitorSettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HealthMonitorSettingsPageState();
}

class _HealthMonitorSettingsPageState
    extends ConsumerState<HealthMonitorSettingsPage> {
  bool isGPS = false;
  bool isHealthLimit = true;
  bool isLowBatteryWarning = false;
  bool isSmsNotification = false;
  bool isEmailNotification = false;
  bool isApplicationNotice = false;

  TextEditingController a = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: "",
        title: LocaleKeys.health_monitor_health_monitor,
        isShort: true,
        onDispose: () {},
        onModelReady: (model) {},
        onPageBuilder: (context, value) => Padding(
              padding: PaddingConstants.widePadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texty(
                        text: LocaleKeys.health_monitor_product_code,
                        fontSize: 16,
                        color: ColorConstants.BLUE_FONT,
                      ),
                      WidthBox(width: 20),
                      Container(
                        width: SizeConfig.sizeWidth(context, 0.5),
                        height: 40,
                        child: StandartInputBox(
                          keyboard: TextInputType.emailAddress,
                          contentPadding:
                              PaddingConstants.TEXTFIELDCONTENTPADDING,
                          hintText: "",
                          controller: a,
                        ),
                      ),
                    ],
                  ),
                  HeightBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texty(
                        text: LocaleKeys.health_monitor_product_name,
                        fontSize: 16,
                        color: ColorConstants.BLUE_FONT,
                      ),
                      WidthBox(width: 20),
                      Container(
                        height: 40,
                        width: SizeConfig.sizeWidth(context, 0.5),
                        child: StandartInputBox(
                          keyboard: TextInputType.emailAddress,
                          contentPadding:
                              PaddingConstants.TEXTFIELDCONTENTPADDING,
                          hintText: "",
                          controller: a,
                        ),
                      ),
                    ],
                  ),
                  HeightBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texty(
                        text: LocaleKeys.health_monitor_serial_number,
                        fontSize: 16,
                        color: ColorConstants.BLUE_FONT,
                      ),
                      WidthBox(width: 20),
                      Container(
                        height: 40,
                        width: SizeConfig.sizeWidth(context, 0.5),
                        child: StandartInputBox(
                          keyboard: TextInputType.emailAddress,
                          contentPadding:
                              PaddingConstants.TEXTFIELDCONTENTPADDING,
                          hintText: "",
                          controller: a,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texty(
                          text: LocaleKeys.health_monitor_gps,
                          fontSize: 16,
                          color: ColorConstants.BLUE_FONT),
                      Switch(
                        value: isGPS,
                        onChanged: (value) {
                          setState(() {
                            isGPS = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texty(
                          text: LocaleKeys
                              .health_monitor_health_over_limit_notice,
                          fontSize: 16,
                          color: ColorConstants.BLUE_FONT),
                      Switch(
                        value: isHealthLimit,
                        onChanged: (value) {
                          setState(() {
                            isHealthLimit = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texty(
                          text: LocaleKeys.health_monitor_low_battery_warning,
                          fontSize: 16,
                          color: ColorConstants.BLUE_FONT),
                      Switch(
                        value: isLowBatteryWarning,
                        onChanged: (value) {
                          setState(() {
                            isLowBatteryWarning = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texty(
                          text: LocaleKeys.health_monitor_sms_notification,
                          fontSize: 16,
                          color: ColorConstants.BLUE_FONT),
                      Switch(
                        value: isSmsNotification,
                        onChanged: (value) {
                          setState(() {
                            isSmsNotification = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texty(
                          text: LocaleKeys.health_monitor_email_notification,
                          fontSize: 16,
                          color: ColorConstants.BLUE_FONT),
                      Switch(
                        value: isEmailNotification,
                        onChanged: (value) {
                          setState(() {
                            isEmailNotification = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Texty(
                          text: LocaleKeys.health_monitor_application_notice,
                          fontSize: 16,
                          color: ColorConstants.BLUE_FONT),
                      Switch(
                        value: isApplicationNotice,
                        onChanged: (value) {
                          setState(() {
                            isApplicationNotice = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
