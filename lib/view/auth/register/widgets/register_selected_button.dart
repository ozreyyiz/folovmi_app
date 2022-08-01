import 'package:flutter/material.dart';

import '../../../../core/components/text/texty.dart';
import '../../../../core/constants/color/color_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

class RegisterSelectedButton extends StatelessWidget {
  final String number;
  const RegisterSelectedButton({
    Key? key, required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: ColorConstants.BLUE,borderRadius: BorderRadius.circular(30)
      ),
      child: Center(
        child: Texty(
          text:number,
          fontSize: 16,
          color: ColorConstants.WHITE,
        ),
      ),
    );
  }
}