import 'package:flutter/material.dart';

import '../../../../core/components/input/standart_input_box.dart';
import '../../../../core/constants/padding/padding_constants.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

class SignUpInputBox extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboard;
  const SignUpInputBox({
    Key? key,
    required this.hintText,
    required this.controller, required this.keyboard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StandartInputBox(keyboard: keyboard,
        controller: controller,
        contentPadding: PaddingConstants.TEXTFIELDCONTENTPADDING,
        hintText: hintText);
  }
}
