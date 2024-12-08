import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLarge;

  const CustomOutlinedButton({Key? key, required this.onPressed, required this.isLarge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.brown, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      child: SingleChildScrollView(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.logout,
              color: AppColors.brown,
              size:isLarge? 16:20,
            ),
             isLarge?Gap(8) :SizedBox.shrink(),
           isLarge? CustomTextWidget(
             textOverflow: TextOverflow.ellipsis,
             text:  'Log Out',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textColor: AppColors.brown,
            ):SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
