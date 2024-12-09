import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_icons.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_text_widget.dart';
class CustomOverViewCotainer extends StatelessWidget {
  const CustomOverViewCotainer({
    super.key,
    this.heading = "6,257",
    this.subHeading = "Total orders",
    this.subContainerText= "+4.9%",
    this.subContainerColor = AppColors.blue,
  });
  final String heading;
  final String subHeading;
  final String subContainerText;
  final Color subContainerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes()
          .getCustomPadding(top: 3, bottom: 3, right: 2, left: 2),
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
                    text: heading,
                    fontSize: 38,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.brown,
                  ),
                  Gap(9),
                  CustomTextWidget(
                    text: subHeading,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.brown,
                  ),
                ],
              ),
              Gap(138),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: subContainerColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(6)),
                child: SvgPicture.asset(
                  AppIcons.threeUsers,
                  color: subContainerColor,
                ),
              )
            ],
          ),
          Gap(24),
          Container(
            padding:
            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
                color: subContainerColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6)),
            child: CustomTextWidget(
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