import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_text_widget.dart';
class CustomRowContainer extends StatelessWidget {
  const CustomRowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes().getWidthPercentage(100),
      padding: AppSizes().getCustomPadding(
          top: 2.5, bottom: 2.5, right: 1, left: 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: AppColors.halfWhite2),
      child: ScrollConfiguration(
        behavior: ScrollBehavior()
            .copyWith(overscroll: false, scrollbars: false),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Gap(AppSizes().getWidthPercentage(5.3)),
              Expanded(
                child: CustomTextWidget(
                  text: "ID",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  textColor: AppColors.brown,
                ),
              ),
              Expanded(
                child: CustomTextWidget(
                  textOverflow: TextOverflow.ellipsis,
                  text: "PICTURE",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  textColor: AppColors.brown,
                ),
              ),
              Expanded(
                child: CustomTextWidget(
                  textOverflow: TextOverflow.ellipsis,
                  text: "EMPLOYEE NAME",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  textColor: AppColors.brown,
                ),
              ),
              Expanded(
                child: CustomTextWidget(
                  textOverflow: TextOverflow.ellipsis,
                  text: "POSITION",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  textColor: AppColors.brown,
                ),
              ),
              Expanded(
                child: CustomTextWidget(
                  textOverflow: TextOverflow.ellipsis,
                  text: "WORKFLOW SCORE",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  textColor: AppColors.brown,
                ),
              ),
              Expanded(
                child: CustomTextWidget(
                  textOverflow: TextOverflow.ellipsis,
                  text: "PERFORMANCE SCORE",
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  textColor: AppColors.brown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}