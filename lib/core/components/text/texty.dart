import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:folovmi_app/core/init/extension/string_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class Texty extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const Texty(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.locale,
      // overflow: TextOverflow.ellipsis,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
