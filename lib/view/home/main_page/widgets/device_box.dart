import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/components/text/texty.dart';
import '../../../../core/constants/border_radius/border_radius_constants.dart';
import '../../../../core/constants/color/color_constants.dart';

class DeviceBox extends StatelessWidget {
  final String text;
  final String iconPath;
  final Widget widget;
  const DeviceBox({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorConstants.WHITE,
            borderRadius: BorderRadiusConstants.SMALL_BUTTON,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 224, 226, 229),
                offset: const Offset(
                  0.0,
                  0.5,
                ),
                blurRadius: 1.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SizedBox(height: 30, child: SvgPicture.asset(iconPath)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      width: 120,
                      child: Texty(
                        text: text,
                        fontSize: 16,
                        color: ColorConstants.BLUE_DARK,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
