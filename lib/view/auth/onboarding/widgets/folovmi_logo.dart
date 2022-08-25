import 'package:flutter/material.dart';
import 'package:folovmi_app/core/init/extension/string_extension.dart';

import '../../../../core/components/animations/easy_in_out.dart';
import '../../../../core/constants/color/color_constants.dart';
import '../../../../core/constants/size/size_config.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

class FolovmiLogo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.WHITE,
      child: Column(
        children: [
          Image.asset("assets/images/folovmi_logo.png",
              height: SizeConfig.sizeHeight(context, 5.7 / 14)),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Column(
              children: [
                Text(
                  LocaleKeys.welcome_name.locale,
                  style: TextStyle(
                      fontSize: 22,
                      color: ColorConstants.BLACK,
                      fontFamily: "neuropolitical"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 5,
                  ),
                  child: Text(
                    LocaleKeys.welcome_subtitle.locale,
                    style: TextStyle(
                        fontSize: 15,
                        color: ColorConstants.BLACK,
                        fontFamily: "neuropolitical"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
