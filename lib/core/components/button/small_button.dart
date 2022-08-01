import 'package:flutter/material.dart';
import 'package:folovmi_app/core/base/state/base_state.dart';

import '../../constants/border_radius/border_radius_constants.dart';
import '../../constants/color/color_constants.dart';
import '../text/texty.dart';

class SmallButton extends StatefulWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color color;
  final String text;
  SmallButton(
      {Key? key,
      required this.onTap,
      required this.height,
      required this.width,
      required this.color,
      required this.text})
      : super(key: key);

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends BaseState<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadiusConstants.SMALL_BUTTON,
        ),
        child: Center(
          child: Texty(
            text: widget.text,
            fontSize: 18,
            color: ColorConstants.WHITE,
          ),
        ),
      ),
    );
  }
}
