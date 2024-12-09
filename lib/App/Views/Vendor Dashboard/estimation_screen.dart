import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/estimation_controller.dart';
import 'package:smart_printing_web/App/Widgets/custom_elevatedButton.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';
import '../../Utils/Const/appColors.dart';
import '../../Utils/Const/app_icons.dart';
import '../../Utils/Const/app_sizes.dart';
import '../../Widgets/custom_container_button.dart';
import '../../Widgets/custom_overview_container.dart';

class EstimationScreen extends StatelessWidget {
  const EstimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EstimationController estimationController = Get.put(EstimationController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = AppSizes().isDesktop();
        return Padding(
          padding:
              AppSizes().getCustomPadding(top: 1, bottom: 2, left: 1, right: 1),
          child: ScrollConfiguration(
            behavior:
                ScrollBehavior().copyWith(scrollbars: false, overscroll: false),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CustomTextWidget(
                            text: "Estimation",
                            fontSize: 22,
                            textColor: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          Gap(4),
                          CustomContainerButton(
                            isLarge: isLarge,
                            text: "Sep 19, 2024",
                            onPress: () {},
                          )
                        ],
                      ),
                      Spacer(),
                      CustomContainerButton(
                        isLarge: isLarge,
                        onPress: () {},
                        leftIcon: Icons.report_outlined,
                        hasRightIcon: false,
                        text: "Report",
                      ),
                      Gap(6),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: Icons.login_rounded,
                        text: "Export",
                        onPress: () {},
                        hasRightIcon: false,
                      ),
                      Gap(6),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: Icons.add_box_outlined,
                        onPress: () {},
                        text: "Post Enquiry",
                        hasRightIcon: false,
                        containerColor: AppColors.lightPrimary,
                      )
                    ],
                  ),
                  Gap(14),
                  isLarge
                      ? ScrollConfiguration(
                          behavior: ScrollBehavior()
                              .copyWith(scrollbars: false, overscroll: false),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomOverViewContainer(
                                  fourInOneLine: true,
                                  iconPath: AppIcons.document,
                                  isLarge: isLarge,
                                  heading: "Dummy",
                                  subContainerText: "+10.5%",
                                  subContainerColor: AppColors.red,
                                  subHeading: "Total Earnings",
                                ),
                                Gap(AppSizes().getWidthPercentage(1)),
                                CustomOverViewContainer(
                                  fourInOneLine: true,
                                  iconPath: AppIcons.document,
                                  isLarge: isLarge,
                                  heading: "Dummy",
                                  subContainerText: "+10.5%",
                                  subContainerColor: AppColors.red,
                                  subHeading: "Total Earnings",
                                ),
                                Gap(AppSizes().getWidthPercentage(1)),
                                CustomOverViewContainer(
                                  fourInOneLine: true,
                                  isLarge: isLarge,
                                  iconPath: AppIcons.document,
                                  heading: "Dummy",
                                  subContainerText: "+3.9%",
                                  subContainerColor: AppColors.red,
                                  subHeading: "Avg Performance Score : 8",
                                ),
                                Gap(AppSizes().getWidthPercentage(1)),
                                CustomOverViewContainer(
                                  fourInOneLine: true,
                                  isLarge: isLarge,
                                  iconPath: AppIcons.document,
                                  heading: "Dummy",
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
                                fourInOneLine: true,
                                iconPath: AppIcons.document,
                                isLarge: isLarge,
                                heading: "Dummy",
                                subContainerText: "+10.5%",
                                subContainerColor: AppColors.red,
                                subHeading: "Total Earnings",
                              ),
                              Gap(AppSizes().getWidthPercentage(1)),
                              CustomOverViewContainer(
                                fourInOneLine: true,
                                iconPath: AppIcons.document,
                                isLarge: isLarge,
                                heading: "Dummy",
                                subContainerText: "+10.5%",
                                subContainerColor: AppColors.red,
                                subHeading: "Total Earnings",
                              ),
                              Gap(AppSizes().getWidthPercentage(1)),
                              CustomOverViewContainer(
                                fourInOneLine: true,
                                isLarge: isLarge,
                                iconPath: AppIcons.document,
                                heading: "Dummy",
                                subContainerText: "+3.9%",
                                subContainerColor: AppColors.red,
                                subHeading: "Avg Performance Score : 8",
                              ),
                              Gap(AppSizes().getWidthPercentage(1)),
                              CustomOverViewContainer(
                                fourInOneLine: true,
                                isLarge: isLarge,
                                iconPath: AppIcons.document,
                                heading: "Dummy",
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
