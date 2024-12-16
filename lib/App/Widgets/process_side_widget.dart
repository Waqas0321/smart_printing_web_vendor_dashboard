import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_divider.dart';
import 'custom_text_widget.dart';
class ProcessSideScreen extends StatelessWidget {
  const ProcessSideScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes().getWidthPercentage(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "Process",
                fontSize: 13,
                fontWeight: FontWeight.w600,
                textColor: AppColors.brown,
              ),
            ],
          ),
          Gap(4),
          CustomDivider(),
          Gap(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightPrimary, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        child: CustomTextWidget(
                          text: "01",
                          fontSize: 9,
                        )),
                    Gap(90),
                    Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightPrimary, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        child: CustomTextWidget(
                          text: "02",
                          fontSize: 9,
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 30,
                child: Column(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 20,
                      color: AppColors.lightPrimary,
                    ),
                    CustomVerticalDivider(
                      height: 90,
                      thickness: 3,
                      color: AppColors.lightPrimary,
                    ),
                    Icon(
                      Icons.circle,
                      size: 20,
                      color: AppColors.lightPrimary,
                    ),
                    CustomVerticalDivider(
                      height: 150,
                      thickness: 3,
                      color: AppColors.lightPrimary,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightPrimary, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        child: CustomTextWidget(
                          text: "Lamination",
                          fontSize: 9,
                        )),
                    Gap(50),
                    Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.lightPrimary, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        child: CustomTextWidget(
                          text: "HoleP Punching",
                          fontSize: 9,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}