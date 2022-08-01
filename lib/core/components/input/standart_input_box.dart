import 'package:flutter/material.dart';
import 'package:folovmi_app/core/constants/color/color_constants.dart';
import 'package:folovmi_app/core/init/extension/string_extension.dart';

import '../../init/lang/locale_keys.g.dart';

class StandartInputBox extends StatelessWidget {
  final EdgeInsetsGeometry contentPadding;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboard;
  const StandartInputBox({
    Key? key,
    required this.contentPadding,
    required this.hintText,
    required this.controller, required this.keyboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(keyboardType: keyboard,
    validator: (value)=>value!.isNotEmpty?null:"This field required.",
      controller: controller,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText.locale,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.INPUT_BOX_BORDER_COLOR,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(33),
        ),
        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.INPUT_BOX_BORDER_COLOR,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(33),
        ), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(33),
        ),
      ),
    );
  }
}
