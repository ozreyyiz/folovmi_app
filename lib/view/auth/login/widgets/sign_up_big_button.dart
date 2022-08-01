import 'package:flutter/material.dart';
import 'package:folovmi_app/core/constants/padding/padding_constants.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';

import '../../../../core/components/button/standart_button.dart';
import '../../../../core/constants/color/color_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

class SignUpBigButton extends StatelessWidget {
  final String text;
  final  VoidCallback onPressed;
  const SignUpBigButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandartButton(
      onPressed: onPressed,
      width: SizeConfig.sizeWidth(context, 0.8),
      color: ColorConstants.BLUE,
      text: text,
      textColor: ColorConstants.WHITE,
      padding: PaddingConstants.BUTTONPADDING,
    );
  }
}
