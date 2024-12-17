import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Routes/app_routes_name.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_outline_button.dart';
import '../../Controllers/Vendor Dashboard/home_controller.dart';
import '../../Widgets/custom_appbar.dart';
import '../../Widgets/custom_sidebar_item.dart';
import '../../Widgets/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: AppColors.halfWhite,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLarge = AppSizes().isDesktop();
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: AppSizes().getHeightPercentage(100),
                  color: AppColors.black,
                  child: ScrollConfiguration(
                    behavior: ScrollBehavior()
                        .copyWith(scrollbars: false, overscroll: false),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: AppSizes()
                                .getCustomPadding(left: 1, bottom: 1, right: 1),
                            child: SvgPicture.asset(AppIcons.appLogo),
                          ),
                          Gap(12),
                          Obx(() {
                            return SidebarItem(
                              isLarge: isLarge,
                              icon: AppIcons.dashboardOutlineIcon,
                              iconTwo: AppIcons.dashboardFilledIcon,
                              label: "Overview",
                              index: 0,
                              isSelected:
                                  homeController.selectedIndex.value == 0,
                              onTap: () => homeController.onSidebarItemTap(0),
                            );
                          }),
                          Obx(() {
                            return SidebarItem(
                              isLarge: isLarge,
                              icon: AppIcons.documentOutlineIcon,
                              iconTwo: AppIcons.documentFilledIcon,
                              label: "Estimation",
                              index: 1,
                              isSelected:
                                  homeController.selectedIndex.value == 1,
                              onTap: () => homeController.onSidebarItemTap(1),
                            );
                          }),
                          Obx(() {
                            return SidebarItem(
                              isLarge: isLarge,
                              icon: AppIcons.documentOutlineIcon,
                              iconTwo: AppIcons.documentOutlineIcon,
                              label: "Orders",
                              index: 2,
                              isSelected:
                                  homeController.selectedIndex.value == 2,
                              onTap: () => homeController.onSidebarItemTap(2),
                            );
                          }),
                          Obx(() {
                            return SidebarItem(
                              isLarge: isLarge,
                              icon: AppIcons.historyOutlineIcon,
                              iconTwo: AppIcons.historyFilledIcon,
                              label: "History",
                              index: 3,
                              isSelected:
                                  homeController.selectedIndex.value == 3,
                              onTap: () => homeController.onSidebarItemTap(3),
                            );
                          }),
                          Gap(24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: CustomTextWidget(
                              textOverflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              text: "Preferences       ",
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              textColor: AppColors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: CustomDivider(
                              color: AppColors.brown,
                              thickness: 0.8,
                            ),
                          ),
                          Gap(8),
                          Obx(() {
                            return SidebarItem(
                              isLarge: isLarge,
                              icon: AppIcons.settingOutlineIcon,
                              iconTwo: AppIcons.settingFilledIcon,
                              label: "Settings",
                              index: 4,
                              isSelected:
                                  homeController.selectedIndex.value == 4,
                              onTap: () => homeController.onSidebarItemTap(4),
                            );
                          }),
                          Obx(() {
                            return SidebarItem(
                              isLarge: isLarge,
                              icon: AppIcons.helpOutlineIcon,
                              iconTwo: AppIcons.helpOutlineIcon,
                              label: "Help Center",
                              index: 5,
                              isSelected:
                                  homeController.selectedIndex.value == 5,
                              onTap: () => homeController.onSidebarItemTap(5),
                            );
                          }),
                          Gap(12),
                          Image(
                            image: AssetImage(AppIcons.sidebarIcon),
                            width: AppSizes().getWidthPercentage(8.3),
                          ),
                          CustomOutlinedButton(
                            haveHoverEffect: true,
                            icon: AppIcons.logoutIcon,
                            isLarge: isLarge,
                            onPressed: () {
                              Get.toNamed(AppRoutesName.loginScreen);
                            },
                          ),
                          Gap(12),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      controller: homeController.searchController,
                      isLarge: isLarge,
                    ),
                    Gap(8),
                    Obx(() {
                      return Expanded(
                        child: homeController
                            .screens[homeController.selectedIndex.value],
                      );
                    }),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
