import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/history_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/orders_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_text_widget.dart';

class OverflowScreen extends StatelessWidget {
  const OverflowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersController = Get.put(OrdersController());
    final historyController = Get.put(HistoryController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = AppSizes().isDesktop();
        return Padding(
          padding:
              AppSizes().getCustomPadding(top: 1, bottom: 2, left: 1, right: 1),
          child: ScrollConfiguration(
            behavior:
                ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
            child: ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(overscroll: false,scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomTextWidget(
                          text: "Workflow",
                          fontSize: 22,
                          textColor: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        CustomContainerButton(
                          isLarge: isLarge,
                          leftIcon: Icons.arrow_back_ios_outlined,
                          text: "Back",
                          textColor: AppColors.brown,
                          hasRightIcon: false,
                          onPress: () {
                            ordersController.selectedIndex.value = 0;
                            historyController.selectedIndex.value = 0;
                          },
                        ),
                      ],
                    ),
                    Gap(18),
                    Container(
                      height: AppSizes().getHeightPercentage(80),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.brown.withOpacity(0.06),
                                blurRadius: 5,
                                spreadRadius: 3)
                          ]),
                      child: Padding(
                        padding: AppSizes().getCustomPadding(),
                        child: Center(
                          child: Column(
                            children: [
                              Gap(22),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(19.5)),
                                child: Row(
                                  children: [
                                    CustomFlowText(text: "Stock Release",),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(32)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.arrow,height: 14,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(35)),
                                child: Row(
                                  children: [
                                    CustomFlowText(text: "Printing",),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(44)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.arrow,height: 14,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(47)),
                                child: Row(
                                  children: [
                                    CustomFlowText(text: "Lamination",),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(58)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.arrow,height: 14,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(61)),
                                child: Row(
                                  children: [
                                    CustomFlowText(text: "Gutting",),
                                  ],
                                ),
                              ),
                              Gap(2),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(65)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.arrowBelow,height: 30,),
                                  ],
                                ),
                              ),
                              Gap(2),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(54)),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      CustomFlowText(text: "Quality Check",),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(58)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.arrowBack,height: 18,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(50)),
                                child: Row(
                                  children: [
                                    CustomFlowText(
                                      withBackgroundColor: true,
                                      text: "Passed",),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(47)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.arrowBack,height: 18,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(37)),
                                child: Row(
                                  children: [
                                    CustomFlowText(text: "Packaging",),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(35)),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(AppIcons.arrowBack,height: 16,),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: AppSizes().getWidthPercentage(20)),
                                child: Row(
                                  children: [
                                    CustomFlowText(
                                      borderColor: AppColors.lightPrimary,
                                      text: "Ready for Delivery",),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomFlowText extends StatelessWidget {
  const CustomFlowText({
    super.key,
    required this.text,
    this.withBackgroundColor = false,
    this.borderColor = AppColors.black,
  });

  final String text;
  final bool withBackgroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Change cursor on hover
      child: Tooltip(
        message: "$text\nMore Information", // Adding a newline for two lines of text
        textStyle: GoogleFonts.montserrat(
          color: AppColors.brown,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: AppColors.halfWhite2,
          borderRadius: BorderRadius.circular(8),
        ),
        preferBelow: false, // Display tooltip above the widget
        child: Container(
          padding: AppSizes().getCustomPadding(top: 1, bottom: 1),
          decoration: BoxDecoration(
            color: withBackgroundColor? AppColors.lightPrimary:null,
            border: withBackgroundColor?null: Border(
              left: BorderSide(width: 2, color: borderColor),
              right: BorderSide(width: 2, color: borderColor),
              top: BorderSide(width: 4, color: borderColor),
              bottom: BorderSide(width: 4, color: borderColor),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: CustomTextWidget(
            text: text,
            textColor:withBackgroundColor?AppColors.brown: AppColors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}


