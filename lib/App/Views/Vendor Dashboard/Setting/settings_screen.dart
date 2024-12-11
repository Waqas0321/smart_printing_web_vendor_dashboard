import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../Controllers/Vendor Dashboard/Settings/settings_controller.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_icons.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_overview_container.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.put(SettingsController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = AppSizes().isDesktop();
        return Padding(
            padding: AppSizes()
                .getCustomPadding(top: 2, bottom: 2, left: 1, right: 1),
            child: isLarge
                ? ScrollConfiguration(
                    behavior: ScrollBehavior()
                        .copyWith(scrollbars: false, overscroll: false),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ScrollConfiguration(
                            behavior: ScrollBehavior()
                                .copyWith(scrollbars: false, overscroll: false),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      settingsController.selectedIndex.value =
                                          1;
                                    },
                                    child: CustomOverViewContainer(
                                      inSetting: true,
                                      iconPath: AppIcons.threeUsers,
                                      isLarge: isLarge,
                                      haveIcon: true,
                                      heading: "Employees",
                                      subContainerText: "+1.5%",
                                      subContainerColor: AppColors.blue,
                                      subHeading: "Employee Detail",
                                    ),
                                  ),
                                  Gap(AppSizes().getWidthPercentage(1)),
                                  GestureDetector(
                                    onTap: () {
                                      settingsController.selectedIndex.value =
                                          2;
                                    },
                                    child: CustomOverViewContainer(
                                      inSetting: true,
                                      iconPath: AppIcons.document,
                                      isLarge: isLarge,
                                      heading: "Products",
                                      haveIcon: true,
                                      subContainerText: "+10.5%",
                                      subContainerColor: AppColors.orange,
                                      subHeading: "Product Detail",
                                    ),
                                  ),
                                  Gap(AppSizes().getWidthPercentage(1)),
                                  GestureDetector(
                                    onTap: () {
                                      settingsController.selectedIndex.value =
                                          3;
                                    },
                                    child: CustomOverViewContainer(
                                      inSetting: true,
                                      iconPath: AppIcons.process,
                                      isLarge: isLarge,
                                      heading: "Processes",
                                      haveIcon: true,
                                      subContainerText: "+3.9%",
                                      subContainerColor: AppColors.red,
                                      subHeading: "Process Detail",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior()
                          .copyWith(overscroll: false, scrollbars: false),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                settingsController.selectedIndex.value = 1;
                              },
                              child: CustomOverViewContainer(
                                inSetting: true,
                                iconPath: AppIcons.threeUsers,
                                isLarge: isLarge,
                                heading: "Employees",
                                subContainerText: "+1.5%",
                                subContainerColor: AppColors.blue,
                                subHeading: "Employee Detail",
                              ),
                            ),
                            Gap(AppSizes().getWidthPercentage(1)),
                            GestureDetector(
                              onTap: () {
                                settingsController.selectedIndex.value = 2;
                              },
                              child: CustomOverViewContainer(
                                iconPath: AppIcons.document,
                                isLarge: isLarge,
                                heading: "Products   ",
                                subContainerText: "+10.5%",
                                subContainerColor: AppColors.orange,
                                subHeading: "Product Detail",
                              ),
                            ),
                            Gap(AppSizes().getWidthPercentage(1)),
                            GestureDetector(
                              onTap: () {
                                settingsController.selectedIndex.value = 3;
                              },
                              child: CustomOverViewContainer(
                                iconPath: AppIcons.process,
                                isLarge: isLarge,
                                heading: "Processes ",
                                subContainerText: "+3.9%",
                                subContainerColor: AppColors.red,
                                subHeading: "Process Detail",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
      },
    );
  }
}
