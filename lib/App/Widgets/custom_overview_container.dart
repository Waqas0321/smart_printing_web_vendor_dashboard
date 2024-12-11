import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_icons.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_text_widget.dart';

class CustomOverViewContainer extends StatelessWidget {
  const CustomOverViewContainer({
    super.key,
    this.heading = "6,257",
    this.subHeading = "Total orders",
    this.subContainerText = "+4.9%",
    this.subContainerColor = AppColors.blue,
    required this.isLarge,
    this.iconPath = AppIcons.threeUsers,
    this.fourInOneLine = false,
    this.inSetting = false,
    this.haveIcon = false,

  });

  final String heading;
  final String subHeading;
  final String subContainerText;
  final Color subContainerColor;
  final bool isLarge;
  final String iconPath;
  final bool fourInOneLine;
  final bool inSetting;
  final bool haveIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          AppSizes().getCustomPadding(top: 3, bottom: 3, right: 2, left: 2),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: AppColors.brown.withOpacity(0.06),
                blurRadius: 5,
                spreadRadius: 3)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    textAlign: TextAlign.start,
                    text: heading,
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.brown,
                  ),
                  Gap(9),
                  SizedBox(
                    width: fourInOneLine ? 140:160,
                    child: CustomTextWidget(
                      textAlign: TextAlign.start,
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: subHeading,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.brown,
                    ),
                  ),
                ],
              ),
              Gap(isLarge
                  ? AppSizes().getWidthPercentage(fourInOneLine ? 0 : inSetting?4: 6)
                  : AppSizes().getWidthPercentage(25)),
              Container(
                margin: EdgeInsets.only(left: 8),
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    color: subContainerColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(6)),
                child: SvgPicture.asset(
                  iconPath,
                  color: subContainerColor,
                ),
              )
            ],
          ),
          Gap(24),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
                color: subContainerColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6)),
            child:haveIcon? Icon(Icons.arrow_forward,color: subContainerColor,):CustomTextWidget(
              text: subContainerText,
              fontWeight: FontWeight.w600,
              fontSize: 15,
              textColor: subContainerColor,
            ),
          )
        ],
      ),
    );
  }
}
