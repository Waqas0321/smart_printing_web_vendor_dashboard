import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/Const/appColors.dart';
import 'custom_text_widget.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.onPress,
  });
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightPrimary,
        ),
        child: CustomTextWidget(
          text: "text",
          fontWeight: FontWeight.w600,
          fontSize: 22,
          textColor: AppColors.black,
        ),
      ),
    );
  }
}
