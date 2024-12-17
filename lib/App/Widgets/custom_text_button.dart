import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.color,
    required this.text,
    required this.hasBorder,
    required this.textColor,
    required this.onPress,
    this.fontSize = 10,
  });

  final Color color;
  final String text;
  final bool hasBorder;
  final Color textColor;
  final VoidCallback onPress;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            border: hasBorder ? Border.all(color: color, width: 0.5) : null,
            color: hasBorder ? color.withOpacity(0.2) : color,
            borderRadius: BorderRadius.circular(6)),
        child: CustomTextWidget(
          text: text,
          fontWeight: FontWeight.w500,
          fontSize: fontSize,
          textColor: textColor,
        ),
      ),
    );
  }
}
