import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/components/box/width_box.dart';
import '../../../../../core/components/text/texty.dart';
import '../../../../../core/constants/color/color_constants.dart';

class DateRow extends StatelessWidget {
    final String date = "16 July 2020 Tuesday 15:05";
  const DateRow({
    Key? key,
  
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WidthBox(width: 20),
        Texty(
          text: date,
          fontSize: 16,
          color: ColorConstants.BLUE_FONT,
        ),
        GestureDetector(
            onTap: () {},
            child: SvgPicture.asset("assets/images/plus_button.svg")),
      ],
    );
  }
}