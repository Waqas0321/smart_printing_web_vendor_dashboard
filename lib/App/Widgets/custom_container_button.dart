import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Utils/Const/appColors.dart';
import 'custom_text_widget.dart';

class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton({
    super.key,
    this.hasRightIcon = true,
    required this.text,
    required this.onPress,
    this.containerColor = AppColors.halfWhite2,
    this.leftIcon = Icons.calendar_month_outlined,
    this.rightIcon = Icons.keyboard_arrow_down,
    required this.isLarge,
  });

  final bool hasRightIcon;
  final String text;
  final VoidCallback onPress;
  final Color containerColor;
  final IconData leftIcon;
  final IconData rightIcon;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        decoration: BoxDecoration(
            color: containerColor, borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            Icon(
              leftIcon,
              color: AppColors.brown,
              size: 20,
            ),
            Gap(4),
          isLarge?  CustomTextWidget(
              text: text,
              fontSize: 12,
              textColor: AppColors.brown,
              fontWeight: FontWeight.w500,
            ):SizedBox.shrink(),
            Gap(2),
            hasRightIcon
                ? Icon(
                    rightIcon,
                    color: AppColors.brown,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
