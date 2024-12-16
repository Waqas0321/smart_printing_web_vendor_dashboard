import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: iconColor, width: 1.5),
        borderRadius: isCircular
            ? null
            : BorderRadius.circular(8),
        shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: hasJustIcon
            ? Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                        icon,
                        color: iconColor,
                        size: isLarge ? 16 : 20,
                      ),
            )
            : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
            child: Row(
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
          ),
        ),
      ),
    );
  }
}