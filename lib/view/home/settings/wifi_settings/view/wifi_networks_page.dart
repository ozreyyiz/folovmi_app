import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/core/components/box/width_box.dart';
import 'package:folovmi_app/core/components/button/standart_button.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/border_radius/border_radius_constants.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';

class WifiNetworkPage extends StatefulWidget {
  WifiNetworkPage({Key? key}) : super(key: key);

  @override
  State<WifiNetworkPage> createState() => _WifiNetworkPageState();
}

class _WifiNetworkPageState extends State<WifiNetworkPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      isNavigationBar: false,
      isShort: false,
      title: LocaleKeys.wifi_wifi,
      viewModel: "",
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: PaddingConstants.generalPadding,
              child: Column(
                children: [
                  Padding(
                    padding: PaddingConstants.WIFI_ROW_HORIZONTAL_PADDING,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Texty(
                          text: LocaleKeys.wifi_wifi,
                          fontSize: 25,
                          color: ColorConstants.BLUE_FONT,
                        ),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Texty(
                        text: LocaleKeys.wifi_connected,
                        fontSize: 18,
                        color: ColorConstants.GRAY_FONT,
                      ),
                    ],
                  ),
                  Padding(
                    padding: PaddingConstants.WIFI_NETWORKS_PADDING,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: SizeConfig.sizeWidth(context, 0.05),
                            child: SvgPicture.asset(
                                "assets/images/small_wifi.svg")),
                        SizedBox(
                          width: SizeConfig.sizeWidth(context, 0.55),
                          child: Texty(
                            text: "SUPERONLINEWİFİ_3173",
                            fontSize: 20,
                            color: ColorConstants.BLUE,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.sizeWidth(context, 0.20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/wifi_lock_black.svg"),
                              SvgPicture.asset("assets/images/wifi_arrow.svg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: PaddingConstants.WIFI_NETWORKS_PADDING,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: SizeConfig.sizeWidth(context, 0.05),
                            child: SvgPicture.asset(
                                "assets/images/small_wifi.svg")),
                        SizedBox(
                          width: SizeConfig.sizeWidth(context, 0.55),
                          child: Texty(
                            text: "SUPERONLINEWİFİ_3173",
                            fontSize: 20,
                            color: ColorConstants.BLUE,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.sizeWidth(context, 0.20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/wifi_lock_black.svg"),
                              SvgPicture.asset("assets/images/wifi_arrow.svg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Texty(
                        text: LocaleKeys.wifi_available_networks,
                        fontSize: 18,
                        color: ColorConstants.GRAY_FONT,
                      ),
                    ],
                  ),
                  Padding(
                    padding: PaddingConstants.WIFI_NETWORKS_PADDING,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: SizeConfig.sizeWidth(context, 0.05),
                            child: SvgPicture.asset(
                                "assets/images/small_wifi.svg")),
                        SizedBox(
                          width: SizeConfig.sizeWidth(context, 0.55),
                          child: Texty(
                            text: "SUPERONLINEWİFİ_3173",
                            fontSize: 20,
                            color: ColorConstants.BLUE,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.sizeWidth(context, 0.20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/wifi_lock_black.svg"),
                              SvgPicture.asset("assets/images/wifi_arrow.svg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: PaddingConstants.WIFI_NETWORKS_PADDING,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: SizeConfig.sizeWidth(context, 0.05),
                            child: SvgPicture.asset(
                                "assets/images/small_wifi.svg")),
                        SizedBox(
                          width: SizeConfig.sizeWidth(context, 0.55),
                          child: Texty(
                            text: "SUPERONLINEWİFİ_3173",
                            fontSize: 20,
                            color: ColorConstants.BLUE,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.sizeWidth(context, 0.20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                  "assets/images/wifi_lock_black.svg"),
                              SvgPicture.asset("assets/images/wifi_arrow.svg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Material(
              elevation: 40,
              child: Container(
                width: SizeConfig.sizeWidth(context, 1),
                height: SizeConfig.sizeHeight(context, 0.2),
                color: ColorConstants.WHITE,
                child: Center(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: ColorConstants.BLUE,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadiusConstants.BORDER_RADIUS_CONTAINER,
                        ),
                      ),
                      onPressed: () {},
                      child: Container(
                        width: SizeConfig.sizeWidth(context, 0.7),
                        child: Center(
                          child: Padding(
                            padding: PaddingConstants.REFRESHBUTTONPADDING,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WidthBox(width: 10),
                                Texty(
                                  text: LocaleKeys.wifi_refresh,
                                  color: ColorConstants.WHITE,
                                  fontSize: 20,
                                ),
                                SvgPicture.asset(
                                    "assets/images/wifi_refresh.svg"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
