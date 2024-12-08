import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_icons.dart';
import '../Utils/Const/app_sizes.dart';

class CustomCircularContainer extends StatelessWidget {
  const CustomCircularContainer({
    super.key,
    this.icon = AppIcons.mailIcon,
    this.iconColor = AppColors.darkBlue,
    this.bgColor = AppColors.halfWhite,
  });
  final String icon;
  final Color iconColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes().getCustomPadding(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      child: SvgPicture.asset(
        icon,
        height: 30,
        width: 30,
        color: AppColors.darkBlue,
      ),
    );
  }
}