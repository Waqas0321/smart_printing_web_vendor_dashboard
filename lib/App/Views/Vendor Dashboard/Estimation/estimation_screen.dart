import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/estimation_controller.dart';
import 'package:smart_printing_web/App/Services/calender_open.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_icons.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_dialgue_box.dart';
import '../../../Widgets/custom_divider.dart';
import '../../../Widgets/custom_outline_button.dart';
import '../../../Widgets/custom_overview_container.dart';
import '../../../Widgets/custom_text_button.dart';

class EstimationScreen extends StatelessWidget {
  const EstimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EstimationController estimationController = Get.put(EstimationController());
    final selectDateController = Get.put(OpenCalendarService());
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
                          Obx(() {
                            final date =
                                selectDateController.selectedDate.value;
                            return CustomContainerButton(
                              isLarge: isLarge,
                              text: DateFormat('yyyy-MM-dd').format(date),
                              onPress: () {
                                selectDateController
                                    .openCalendarDialog(context);
                              },
                            );
                          })
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
                        onPress: () {
                          Get.dialog(
                            CustomDialgueBox(
                              firstController:
                                  estimationController.nameController,
                              secondsController:
                                  estimationController.detailsController,
                              isSecond: true,
                              iconPath: AppIcons.InfoSquare,
                              heading: "Post Enquiry",
                              isLarge: isLarge,
                              onPress: () {
                                Get.back();
                              },
                            ),
                            barrierDismissible:
                                false, // Prevent closing by tapping outside
                          );
                        },
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
                            child: Column(
                              children: [
                                ScrollConfiguration(
                                  behavior: ScrollBehavior().copyWith(
                                      scrollbars: false, overscroll: false),
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
                                          subHeading:
                                              "Avg Performance Score : 8",
                                        ),
                                        Gap(AppSizes().getWidthPercentage(1)),
                                        CustomOverViewContainer(
                                          fourInOneLine: true,
                                          isLarge: isLarge,
                                          iconPath: AppIcons.document,
                                          heading: "0 -",
                                          subContainerText: "+3.9%",
                                          subContainerColor: AppColors.red,
                                          subHeading:
                                              "Avg Performance Score : 8",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Gap(18),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomOutlinedButton(
                                      onPressed: () {},
                                      isLarge: isLarge,
                                      hasJustIcon: true,
                                      iconColor: AppColors.primary,
                                      isCircular: true,
                                      icon: CupertinoIcons.down_arrow,
                                    ),
                                    Gap(8),
                                    CustomOutlinedButton(
                                      onPressed: () {},
                                      isLarge: isLarge,
                                      hasJustIcon: true,
                                      iconColor: AppColors.primary,
                                      isCircular: true,
                                      icon: Icons.mode_edit_outline_sharp,
                                    ),
                                    Gap(8),
                                    CustomOutlinedButton(
                                      onPressed: () {},
                                      isLarge: isLarge,
                                      hasJustIcon: true,
                                      iconColor: AppColors.red,
                                      isCircular: true,
                                      icon: Icons.delete_outline,
                                    )
                                  ],
                                ),
                                Gap(18),
                                Container(
                                  width: AppSizes().getWidthPercentage(100),
                                  padding: AppSizes().getCustomPadding(
                                      right: 1, left: 1, top: 1, bottom: 0),
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.brown
                                                .withOpacity(0.06),
                                            blurRadius: 5,
                                            spreadRadius: 3)
                                      ]),
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            AppSizes().getWidthPercentage(100),
                                        padding: AppSizes().getCustomPadding(
                                            top: 2.5,
                                            bottom: 2.5,
                                            right: 0,
                                            left: 0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            color: AppColors.halfWhite2),
                                        child: ScrollConfiguration(
                                          behavior: ScrollBehavior().copyWith(
                                              overscroll: false,
                                              scrollbars: false),
                                          child: SingleChildScrollView(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Gap(AppSizes()
                                                    .getWidthPercentage(3)),
                                                Expanded(
                                                  child: CustomTextWidget(
                                                    text: "ESTIMATION ID",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "PRODUCT TYPE",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "CUSTOMER NAME",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "POSTED BY",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text:
                                                        "STATUS                                      ",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "COUNTDOWN TIMER",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "ACTIONS",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListView.separated(
                                        itemCount: estimationController
                                            .boolList.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            width: AppSizes()
                                                .getWidthPercentage(100),
                                            padding: AppSizes()
                                                .getCustomPadding(
                                                    top: 2.5,
                                                    bottom: 2.5,
                                                    right: 0,
                                                    left: 1),
                                            child: ScrollConfiguration(
                                              behavior: ScrollBehavior()
                                                  .copyWith(
                                                      overscroll: false,
                                                      scrollbars: false),
                                              child: SingleChildScrollView(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Obx(
                                                      () => Checkbox(
                                                        value:
                                                            estimationController
                                                                .boolList[index]
                                                                .value,
                                                        onChanged: (value) {
                                                          estimationController
                                                              .toggleCheckbox(
                                                                  index, value);
                                                        },
                                                        activeColor: AppColors
                                                            .lightPrimary,
                                                        checkColor:
                                                            AppColors.tertiary,
                                                      ),
                                                    ),
                                                    CustomTextWidget(
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      text: "#0001",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      textColor:
                                                          AppColors.brown,
                                                    ),
                                                    CustomTextWidget(
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      text: "Dummy",
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      textColor:
                                                          AppColors.brown,
                                                    ),
                                                    CustomTextWidget(
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      text: "Smith",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      textColor:
                                                          AppColors.brown,
                                                    ),
                                                    CustomTextWidget(
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      text:
                                                          "                   John",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      textColor:
                                                          AppColors.brown,
                                                    ),
                                                    CustomTextButton(
                                                      color: AppColors.blue,
                                                      hasBorder: true,
                                                      textColor: AppColors.blue,
                                                      text: "Pending",
                                                      onPress: () {},
                                                    ),
                                                    CustomTextWidget(
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      text: "23 : 59 : 57",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12,
                                                      textColor:
                                                          AppColors.brown,
                                                    ),
                                                    SizedBox(
                                                      width: 130,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                CustomTextButton(
                                                              color: AppColors
                                                                  .lightPrimary,
                                                              hasBorder: false,
                                                              textColor:
                                                                  AppColors
                                                                      .brown,

                                                              text: "Reply",
                                                              onPress: () {
                                                                estimationController.selectedIndex.value = 1;
                                                              },
                                                            ),
                                                          ),
                                                          Gap(2),
                                                          Expanded(
                                                            child:
                                                                CustomTextButton(
                                                              color:
                                                                  AppColors.red,
                                                              hasBorder: false,
                                                              textColor:
                                                                  AppColors
                                                                      .white,
                                                              text: "COJD",
                                                              onPress: () {
                                                                Get.dialog(
                                                                  CustomDialgueBox(
                                                                    firstController:
                                                                        estimationController
                                                                            .nameController,
                                                                    secondsController:
                                                                        estimationController
                                                                            .detailsController,
                                                                    isThird:
                                                                        true,
                                                                    iconPath:
                                                                        AppIcons
                                                                            .InfoSquare,
                                                                    heading:
                                                                        "COJD Details",
                                                                    isLarge:
                                                                        isLarge,
                                                                    onPress:
                                                                        () {
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  barrierDismissible:
                                                                      false,
                                                                );
                                                              },
                                                            ),
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
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return CustomDivider();
                                        },
                                      ),
                                    ],
                                  ),
                                )
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
                                heading: "0 -   ",
                                subContainerText: "+3.9%",
                                subContainerColor: AppColors.red,
                                subHeading: "Avg Performance Score : 8",
                              ),
                              Gap(18),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomOutlinedButton(
                                    onPressed: () {},
                                    isLarge: isLarge,
                                    hasJustIcon: true,
                                    iconColor: AppColors.primary,
                                    isCircular: true,
                                    icon: CupertinoIcons.down_arrow,
                                  ),
                                  CustomOutlinedButton(
                                    onPressed: () {},
                                    isLarge: isLarge,
                                    hasJustIcon: true,
                                    iconColor: AppColors.primary,
                                    isCircular: true,
                                    icon: Icons.mode_edit_outline_sharp,
                                  ),
                                  CustomOutlinedButton(
                                    onPressed: () {},
                                    isLarge: isLarge,
                                    hasJustIcon: true,
                                    iconColor: AppColors.red,
                                    isCircular: true,
                                    icon: Icons.delete_outline,
                                  )
                                ],
                              ),
                              Gap(18),
                              Container(
                                width: AppSizes().getWidthPercentage(100),
                                padding: AppSizes().getCustomPadding(
                                    right: 1, left: 1, top: 1, bottom: 0),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.brown.withOpacity(0.06),
                                          blurRadius: 5,
                                          spreadRadius: 3)
                                    ]),
                                child: Column(
                                  children: [
                                    Container(
                                      width: AppSizes().getWidthPercentage(100),
                                      padding: AppSizes().getCustomPadding(
                                          top: 2.5,
                                          bottom: 2.5,
                                          right: 0,
                                          left: 0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(9),
                                          color: AppColors.halfWhite2),
                                      child: ScrollConfiguration(
                                        behavior: ScrollBehavior().copyWith(
                                            overscroll: false,
                                            scrollbars: false),
                                        child: SingleChildScrollView(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Gap(AppSizes()
                                                  .getWidthPercentage(3)),
                                              Expanded(
                                                child: CustomTextWidget(
                                                  text: "ESTIMATION ID",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                              ),
                                              Expanded(
                                                child: CustomTextWidget(
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  text: "PRODUCT TYPE",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                              ),
                                              Expanded(
                                                child: CustomTextWidget(
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  text: "CUSTOMER NAME",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                              ),
                                              Expanded(
                                                child: CustomTextWidget(
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  text: "POSTED BY",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                              ),
                                              Expanded(
                                                child: CustomTextWidget(
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  text:
                                                      "STATUS                                      ",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                              ),
                                              Expanded(
                                                child: CustomTextWidget(
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  text: "COUNTDOWN TIMER",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                              ),
                                              Expanded(
                                                child: CustomTextWidget(
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  text: "ACTIONS",
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    ListView.separated(
                                      itemCount:
                                          estimationController.boolList.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: AppSizes()
                                              .getWidthPercentage(100),
                                          padding: AppSizes().getCustomPadding(
                                              top: 2.5,
                                              bottom: 2.5,
                                              right: 0,
                                              left: 1),
                                          child: ScrollConfiguration(
                                            behavior: ScrollBehavior().copyWith(
                                                overscroll: false,
                                                scrollbars: false),
                                            child: SingleChildScrollView(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Obx(
                                                    () => Checkbox(
                                                      value:
                                                          estimationController
                                                              .boolList[index]
                                                              .value,
                                                      onChanged: (value) {
                                                        estimationController
                                                            .toggleCheckbox(
                                                                index, value);
                                                      },
                                                      activeColor: AppColors
                                                          .lightPrimary,
                                                      checkColor:
                                                          AppColors.tertiary,
                                                    ),
                                                  ),
                                                  CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "#0001",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                  CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "Dummy",
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                  CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "Smith",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                  CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "John",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                  Expanded(
                                                    child: CustomTextButton(
                                                      color: AppColors.blue,
                                                      hasBorder: true,
                                                      textColor: AppColors.blue,
                                                      text: "Pending",
                                                      onPress: () {},
                                                    ),
                                                  ),
                                                  CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "23 : 59 : 57",
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    textColor: AppColors.brown,
                                                  ),
                                                  Expanded(
                                                    child: SizedBox(
                                                      width: 120,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                CustomTextButton(
                                                              color: AppColors
                                                                  .lightPrimary,
                                                              hasBorder: false,
                                                              textColor:
                                                                  AppColors
                                                                      .brown,
                                                              text: "Reply",
                                                              onPress: () {
                                                                estimationController.selectedIndex.value = 1;
                                                              },
                                                            ),
                                                          ),
                                                          Gap(2),
                                                          Expanded(
                                                            child:
                                                                CustomTextButton(
                                                              color:
                                                                  AppColors.red,
                                                              hasBorder: false,
                                                              textColor:
                                                                  AppColors
                                                                      .white,
                                                              text: "COJD",
                                                              onPress: () {
                                                                Get.dialog(
                                                                  CustomDialgueBox(
                                                                    firstController:
                                                                        estimationController
                                                                            .nameController,
                                                                    secondsController:
                                                                        estimationController
                                                                            .detailsController,
                                                                    isThird:
                                                                        true,
                                                                    iconPath:
                                                                        AppIcons
                                                                            .InfoSquare,
                                                                    heading:
                                                                        "Post Enquiry",
                                                                    isLarge:
                                                                        isLarge,
                                                                    onPress:
                                                                        () {
                                                                      Get.back();
                                                                    },
                                                                  ),
                                                                  barrierDismissible:
                                                                      false,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return CustomDivider();
                                      },
                                    ),
                                  ],
                                ),
                              )
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
