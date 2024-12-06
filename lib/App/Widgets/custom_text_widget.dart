import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utils/Const/appColors.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14,
    this.textColor = AppColors.black,
    required this.text,
    this.textAlign = TextAlign.center,
    this.underlined = false,
    this.textOverflow = TextOverflow.visible,
    this.maxLines
  });

  final FontWeight fontWeight;
  final double fontSize;
  final Color textColor;
  final String text;
  final TextAlign textAlign;
  final bool underlined;
  final TextOverflow textOverflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      overflow: textOverflow,
        textAlign: textAlign,
        text,
        style: GoogleFonts.montserrat(
          height: 0,
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight,
            decoration: underlined ? TextDecoration.underline : null,
            decorationColor: textColor));
  }
}
