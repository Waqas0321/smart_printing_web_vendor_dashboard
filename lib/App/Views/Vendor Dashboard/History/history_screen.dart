import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/history_controller.dart';
import '../../../Services/calender_open.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_images.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_divider.dart';
import '../../../Widgets/custom_outline_button.dart';
import '../../../Widgets/custom_text_button.dart';
import '../../../Widgets/custom_text_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryController historyController = Get.put(HistoryController());
    final selectDateController = Get.put(OpenCalendarService());
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = AppSizes().isDesktop();
        return Padding(
          padding:
              AppSizes().getCustomPadding(top: 1, bottom: 2, left: 1, right: 1),
          child: ScrollConfiguration(
            behavior:
                ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CustomTextWidget(
                            text: "Order History",
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
                        leftIcon: Icons.login_rounded,
                        text: "Export",
                        onPress: () {},
                        hasRightIcon: false,
                      ),
                      Gap(6),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: Icons.report_outlined,
                        onPress: () {},
                        text: "Report",
                        hasRightIcon: false,
                      )
                    ],
                  ),
                  Gap(18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: AppSizes().getCustomPadding(
                            top: 0.5, bottom: 0.2, right: 0.5, left: 0.5),
                        width: isLarge
                            ? AppSizes().getWidthPercentage(22)
                            : AppSizes().getWidthPercentage(52),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.brown.withOpacity(0.06),
                                  blurRadius: 5,
                                  spreadRadius: 3)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => CustomTextButton(
                                color: historyController.all.value
                                    ? AppColors.lightPrimary
                                    : AppColors.halfWhite2,
                                text: "All",
                                hasBorder: false,
                                textColor: AppColors.brown,
                                onPress: () {
                                  historyController.filterButtons("All");
                                },
                              ),
                            ),
                            Obx(
                              () => CustomTextButton(
                                color: historyController.completed.value
                                    ? AppColors.lightPrimary
                                    : AppColors.halfWhite2,
                                text: "Completed",
                                hasBorder: false,
                                textColor: AppColors.brown,
                                onPress: () {
                                  historyController.filterButtons("Completed");
                                },
                              ),
                            ),
                            Obx(
                              () => CustomTextButton(
                                color: historyController.canceled.value
                                    ? AppColors.lightPrimary
                                    : AppColors.halfWhite2,
                                text: "Canceled",
                                hasBorder: false,
                                textColor: AppColors.brown,
                                onPress: () {
                                  historyController.filterButtons("Canceled");
                                },
                              ),
                            )
                          ],
                        ),
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
                  isLarge
                      ? Container(
                          width: AppSizes().getWidthPercentage(100),
                          padding: AppSizes().getCustomPadding(
                              right: 1, left: 1, top: 1, bottom: 0),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.brown.withOpacity(0.06),
                                    blurRadius: 5,
                                    spreadRadius: 3)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                width: AppSizes().getWidthPercentage(100),
                                padding: AppSizes().getCustomPadding(
                                    top: 2.5, bottom: 2.5, right: 0, left: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: AppColors.halfWhite2),
                                child: ScrollConfiguration(
                                  behavior: ScrollBehavior().copyWith(
                                      overscroll: false, scrollbars: false),
                                  child: SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Gap(AppSizes().getWidthPercentage(3)),
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
                                            text: "DATE",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "PRODUCT NAME",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "ORDER VALUE",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "OWNER",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "STATUS",
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
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "ACTION",
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
                                itemCount: historyController.boolList.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      historyController.selectedIndex.value = 2;
                                    },
                                    child: Container(
                                      width: AppSizes().getWidthPercentage(100),
                                      padding: AppSizes().getCustomPadding(
                                          top: 2.5,
                                          bottom: 2.5,
                                          right: 1,
                                          left: 0),
                                      child: ScrollConfiguration(
                                        behavior: ScrollBehavior().copyWith(
                                            overscroll: false,
                                            scrollbars: false),
                                        child: SingleChildScrollView(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Obx(
                                                () => Checkbox(
                                                  value: historyController
                                                      .boolList[index].value,
                                                  onChanged: (value) {
                                                    historyController
                                                        .toggleCheckbox(
                                                            index, value);
                                                  },
                                                  activeColor:
                                                      AppColors.lightPrimary,
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
                                              SizedBox(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 13,
                                                      backgroundImage:
                                                          AssetImage(AppImages
                                                              .profileImage),
                                                    ),
                                                    Gap(4),
                                                    CustomTextWidget(
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      text: "Dummy",
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 12,
                                                      textColor:
                                                          AppColors.black,
                                                    ),
                                                  ],
                                                ),
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
                                                text: "     2 Qty",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                textColor: AppColors.brown,
                                              ),
                                              CustomTextWidget(
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                text: "    Dummy",
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                textColor: AppColors.brown,
                                              ),
                                              CustomTextWidget(
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                text: "     Smooth",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                textColor: AppColors.brown,
                                              ),
                                              CustomTextWidget(
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                text: "3 Hrs, 20mins",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                textColor: AppColors.brown,
                                              ),
                                              CustomTextWidget(
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                text: "_",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                                textColor: AppColors.brown,
                                              ),
                                              CustomTextButton(
                                                color: AppColors.lightPrimary,
                                                hasBorder: false,
                                                textColor: AppColors.brown,
                                                text: "Workflow",
                                                onPress: () {
                                                  historyController.selectedIndex.value = 1;
                                                },
                                              )
                                            ],
                                          ),
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
                      : Container(
                          width: AppSizes().getWidthPercentage(100),
                          padding: AppSizes().getCustomPadding(
                              right: 1, left: 1, top: 1, bottom: 0),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.brown.withOpacity(0.06),
                                    blurRadius: 5,
                                    spreadRadius: 3)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                width: AppSizes().getWidthPercentage(100),
                                padding: AppSizes().getCustomPadding(
                                    top: 2.5, bottom: 2.5, right: 0, left: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: AppColors.halfWhite2),
                                child: ScrollConfiguration(
                                  behavior: ScrollBehavior().copyWith(
                                      overscroll: false, scrollbars: false),
                                  child: SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Gap(AppSizes().getWidthPercentage(3)),
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
                                            text: "DATE",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "PRODUCT NAME",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "ORDER VALUE",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "OWNER",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "STATUS",
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
                                        Expanded(
                                          child: CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "ACTION",
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
                                itemCount: historyController.boolList.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: AppSizes().getWidthPercentage(100),
                                    padding: AppSizes().getCustomPadding(
                                        top: 2.5,
                                        bottom: 2.5,
                                        right: 1,
                                        left: 0),
                                    child: ScrollConfiguration(
                                      behavior: ScrollBehavior().copyWith(
                                          overscroll: false,
                                          scrollbars: false),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Obx(
                                              () => Checkbox(
                                                value: historyController
                                                    .boolList[index].value,
                                                onChanged: (value) {
                                                  historyController
                                                      .toggleCheckbox(
                                                          index, value);
                                                },
                                                activeColor:
                                                    AppColors.lightPrimary,
                                                checkColor:
                                                    AppColors.tertiary,
                                              ),
                                            ),
                                            CustomTextWidget(
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              text: "#01",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              textColor: AppColors.brown,
                                            ),
                                            SizedBox(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 13,
                                                    backgroundImage:
                                                        AssetImage(AppImages
                                                            .profileImage),
                                                  ),
                                                  Gap(4),
                                                  CustomTextWidget(
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    text: "Dummy",
                                                    fontWeight:
                                                        FontWeight.w800,
                                                    fontSize: 12,
                                                    textColor:
                                                        AppColors.black,
                                                  ),
                                                ],
                                              ),
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
                                              text: "     2 Qty",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              textColor: AppColors.brown,
                                            ),
                                            CustomTextWidget(
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              text: "    Dummy",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              textColor: AppColors.brown,
                                            ),
                                            CustomTextWidget(
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              text: "     Smooth",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              textColor: AppColors.brown,
                                            ),
                                            CustomTextWidget(
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              text: "3 Hrs, 20mins",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              textColor: AppColors.brown,
                                            ),
                                            CustomTextWidget(
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              text: "_",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              textColor: AppColors.brown,
                                            ),
                                            CustomTextButton(
                                              color: AppColors.lightPrimary,
                                              hasBorder: false,
                                              textColor: AppColors.brown,
                                              text: "Workflow",
                                              onPress: () {
                                                historyController.selectedIndex.value = 1;
                                              },
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
          ),
        );
      },
    );
  }
}
