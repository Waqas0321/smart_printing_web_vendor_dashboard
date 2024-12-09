import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/overview_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';

import '../../Widgets/custom_overview_container.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OverviewController overviewController = Get.put(OverviewController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = AppSizes().isDesktop();
        return Padding(
          padding:
              AppSizes().getCustomPadding(top: 2, bottom: 2, left: 1, right: 1),
          child: ScrollConfiguration(
            behavior:
                ScrollBehavior().copyWith(scrollbars: false, overscroll: false),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isLarge
                      ? ScrollConfiguration(
                          behavior: ScrollBehavior()
                              .copyWith(scrollbars: false, overscroll: false),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomOverViewContainer(
                                  iconPath: AppIcons.threeUsers,
                                  isLarge: isLarge,
                                  heading: "4,230",
                                  subContainerText: "+1.5%",
                                  subContainerColor: AppColors.blue,
                                  subHeading: "Total Orders",
                                ),
                                Gap(AppSizes().getWidthPercentage(1)),
                                CustomOverViewContainer(
                                  iconPath: AppIcons.document,
                                  isLarge: isLarge,
                                  heading: "40,230",
                                  subContainerText: "+10.5%",
                                  subContainerColor: AppColors.orange,
                                  subHeading: "Total Earnings",
                                ),
                                Gap(AppSizes().getWidthPercentage(1)),
                                CustomOverViewContainer(
                                  isLarge: isLarge,
                                  iconPath: AppIcons.wallet,
                                  heading: "Struggled",
                                  subContainerText: "+3.9%",
                                  subContainerColor: AppColors.red,
                                  subHeading: "Avg Performance Score : 8",
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomOverViewContainer(
                                iconPath: AppIcons.threeUsers,
                                isLarge: isLarge,
                                heading: "4,230",
                                subContainerText: "+1.5%",
                                subContainerColor: AppColors.blue,
                                subHeading: "Total Orders",
                              ),
                              Gap(AppSizes().getWidthPercentage(1)),
                              CustomOverViewContainer(
                                iconPath: AppIcons.document,
                                isLarge: isLarge,
                                heading: "40,230",
                                subContainerText: "+10.5%",
                                subContainerColor: AppColors.orange,
                                subHeading: "Total Earnings",
                              ),
                              Gap(AppSizes().getWidthPercentage(1)),
                              CustomOverViewContainer(
                                isLarge: isLarge,
                                iconPath: AppIcons.wallet,
                                heading: "Struggled",
                                subContainerText: "+3.9%",
                                subContainerColor: AppColors.red,
                                subHeading: "Avg Performance Score : 8",
                              ),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
