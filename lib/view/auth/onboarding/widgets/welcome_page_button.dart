import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

import '../../../../core/components/button/standart_button.dart';
import '../../../../core/constants/color/color_constants.dart';
import '../../../../core/constants/size/size_config.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

class WelcomePageButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final  GestureTapCallback onPressed;
  const WelcomePageButton({
    Key? key,
    required this.color,
    required this.text,
    required this.textColor, required this.onPressed, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandartButton(onPressed:onPressed ,
      width: SizeConfig.sizeWidth(context, 0.25),
      textColor: textColor,
      color: color,
      text: text,
      padding: EdgeInsets.all(15),
    );
  }
}
