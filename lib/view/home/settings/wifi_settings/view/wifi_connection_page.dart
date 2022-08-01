import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:folovmi_app/core/components/box/height_box.dart';
import 'package:folovmi_app/core/components/button/standart_button.dart';
import 'package:folovmi_app/core/components/input/standart_input_box.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/border_radius/border_radius_constants.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';
import 'package:folovmi_app/core/init/extension/string_extension.dart';
import 'package:folovmi_app/view/home/settings/wifi_settings/view/wifi_networks_page.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';

class WifiConnetionPage extends StatefulWidget {
  WifiConnetionPage({Key? key}) : super(key: key);

  @override
  State<WifiConnetionPage> createState() => _WifiConnetionPageState();
}

class _WifiConnetionPageState extends State<WifiConnetionPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      title: LocaleKeys.wifi_wifi_hotspot,
      isShort: false,
      isMain: false,
      onDispose: () {},
      onModelReady: (model) {},
      onPageBuilder: (context, value) => Padding(
        padding: PaddingConstants.generalPadding,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: SizeConfig.sizeWidth(context, 0.7),
                  child: Text(
                    LocaleKeys.wifi_select_wifi.locale,
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorConstants.BLUE_FONT,
                    ),
                    textAlign: TextAlign.center,
                  )),
              Container(
                child: Stack(
                  children: [
                    SvgPicture.asset("assets/images/big_wifi.svg"),
                  ],
                ),
              ),
              Container(
                height: SizeConfig.sizeHeight(context, 0.34),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstants.ICE,
                  borderRadius: BorderRadiusConstants.CONTAINER_TOP_BORDER,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset("assets/images/small_wifi.svg"),
                        Texty(
                          text: "SUPERONLINE_Wifi",
                          fontSize: 25,
                          color: ColorConstants.BLUE_FONT,
                        ),
                        SvgPicture.asset("assets/images/wifi_change.svg"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SvgPicture.asset("assets/images/wifi_lock_white.svg"),
                        Container(
                          width: SizeConfig.sizeWidth(context, 0.6),
                          child: StandartInputBox(
                            contentPadding:
                                PaddingConstants.TEXTFIELDCONTENTPADDING,
                            hintText: "",
                            controller: controller,
                            keyboard: TextInputType.name,
                          ),
                        ),
                        SvgPicture.asset("assets/images/wifi_eye.svg"),
                      ],
                    ),
                    StandartButton(
                      color: ColorConstants.BLUE,
                      text: LocaleKeys.wifi_next.locale,
                      textColor: ColorConstants.WHITE,
                      padding: PaddingConstants.BUTTONPADDING,
                      width: SizeConfig.sizeWidth(context, 0.6),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WifiNetworkPage()));
                      },
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
