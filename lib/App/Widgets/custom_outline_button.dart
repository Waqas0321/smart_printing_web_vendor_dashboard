import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLarge;
  final bool isCircular;
  final Color iconColor;
  final bool hasJustIcon;
  final IconData icon;

  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.isLarge,
    this.isCircular = false,
    this.iconColor = AppColors.brown,
    this.hasJustIcon = false,
    this.icon = Icons.logout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: iconColor, width: 1.5),
        shape: isCircular
            ? const CircleBorder()
            : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      ),
      child: hasJustIcon
          ? Icon(
        icon,
        color: iconColor,
        size: isLarge ? 16 : 20,
      )
          : Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: isLarge ? 16 : 20,
          ),
          isLarge ? Gap(8) : SizedBox.shrink(),
          isLarge
              ? CustomTextWidget(
            textOverflow: TextOverflow.ellipsis,
            text: 'Log Out',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            textColor: AppColors.brown,
          )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
