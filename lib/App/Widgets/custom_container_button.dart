import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import '../Utils/Const/appColors.dart';
import 'custom_text_widget.dart';

class CustomContainerButton extends StatelessWidget {
  const CustomContainerButton({
    super.key,
    this.hasRightIcon = true,
    required this.text,
    required this.onPress,
    this.containerColor = AppColors.halfWhite2,
    this.leftIcon = AppIcons.downloadIcon,
    this.rightIcon = AppIcons.downloadIcon,
    required this.isLarge,
    this.textColor = AppColors.brown
  });

  final bool hasRightIcon;
  final String text;
  final VoidCallback onPress;
  final Color containerColor;
  final Color textColor;
  final String leftIcon;
  final String rightIcon;
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
            SvgPicture.asset(
              leftIcon,
              color: textColor,
              height: 14,
              width: 14,
            ),
            Gap(4),
          isLarge?  CustomTextWidget(
              text: text,
              fontSize: 12,
              textColor: textColor,
              fontWeight: FontWeight.w500,
            ):SizedBox.shrink(),
            Gap(2),
            hasRightIcon
                ? SvgPicture.asset(
              rightIcon,
              color: textColor,
              height: 14,
              width: 14,
            )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
