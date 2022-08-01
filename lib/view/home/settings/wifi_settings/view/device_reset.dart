import 'package:flutter/material.dart';
import 'package:folovmi_app/core/components/text/texty.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';

class DeviceResetPage extends StatefulWidget {
  DeviceResetPage({Key? key}) : super(key: key);

  @override
  State<DeviceResetPage> createState() => _DeviceResetPageState();
}

class _DeviceResetPageState extends State<DeviceResetPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModel: "",
        title: LocaleKeys.device_reset_device_reset,
        isShort: false,
        isMain: false,
        onDispose: () {},
        onModelReady: (model) {},
        onPageBuilder: (context, value) => Padding(
              padding: PaddingConstants.generalPadding,
              child: Container(
                  height: SizeConfig.sizeHeight(context, 0.7),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Texty(
                            text: LocaleKeys.device_reset_open_close_button,
                            fontSize: 18,
                            color: ColorConstants.BLUE_FONT,
                          ),
                        ],
                      ),
                      Container(
                        height: SizeConfig.sizeHeight(context, 0.3),
                        width: SizeConfig.sizeWidth(context, 0.7),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  )),
            ));
  }
}
