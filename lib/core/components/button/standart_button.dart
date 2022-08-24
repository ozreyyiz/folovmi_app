import 'package:flutter/material.dart';
import 'package:folovmi_app/core/constants/size/size_config.dart';
import 'package:folovmi_app/view/default/view/default_page.dart';

import '../../constants/border_radius/border_radius_constants.dart';
import '../text/texty.dart';

class StandartButton extends StatelessWidget {
  const StandartButton({
    Key? key,
    required this.color,
    required this.text,
    required this.textColor,
    required this.padding,
    required this.width, required this.onPressed, 
  }) : super(key: key);
  final EdgeInsetsGeometry padding;
  final Color color;
  final String text;
  final Color textColor;
  final double width;
  final  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusConstants.BORDER_RADIUS_CONTAINER,
          ),
        ),
        onPressed: onPressed,
        child: Container(
          height: SizeConfig.sizeHeight(context, .08),
          width: width,
          child: Center(
            child: Padding(
              padding: padding,
              child: Texty(
                text: text,
                color: textColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
