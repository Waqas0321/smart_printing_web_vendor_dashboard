import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/Const/appColors.dart';
import 'custom_text_widget.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.onPress, required this.text,this.height = 55,
    this.textSize = 22,
    this.fontWeight = FontWeight.w600,
  });
  final VoidCallback onPress;
  final String text;
  final double height;
  final double textSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPrimary,
        ),
        child: CustomTextWidget(
          text: text,
          fontWeight: fontWeight,
          fontSize: textSize,
          textColor: AppColors.black,
        ),
      ),
    );
  }
}
