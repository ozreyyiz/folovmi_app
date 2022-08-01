import 'package:flutter/material.dart';

import '../../../../core/components/text/texty.dart';
import '../../../../core/constants/color/color_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

class RegisterUnselectedButton extends StatelessWidget {
  final String number;
  final Widget widget;
  const RegisterUnselectedButton({
    Key? key,
    required this.number,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: ColorConstants.WHITE,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: ColorConstants.BLUE,
          ),
        ),
        child: Center(
          child: Texty(
            text: number,
            fontSize: 16,
            color: ColorConstants.BLACK,
          ),
        ),
      ),
    );
  }
}
