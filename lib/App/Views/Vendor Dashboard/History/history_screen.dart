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
import '../../../Widgets/custom_pagination_class.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            top: 0.5, bottom: 0.5, right: 0.25, left: 0.25),
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
                                    : AppColors.white,
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
                                    : AppColors.white,
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
                                    : AppColors.white,
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
                  Container(
                    width: AppSizes().getWidthPercentage(100),
                    padding: AppSizes()
                        .getCustomPadding(right: 1, left: 1, top: 1, bottom: 0),
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
                            color: AppColors.halfWhite2,
                          ),
                          child: Table(
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(50),
                              // Adjust checkbox width
                              1: FlexColumnWidth(),
                              // Flexible column for others
                              2: FlexColumnWidth(),
                              3: FlexColumnWidth(),
                              4: FlexColumnWidth(),
                              5: FlexColumnWidth(),
                              6: FlexColumnWidth(),
                              7: FlexColumnWidth(),
                              8: FlexColumnWidth(),
                              9: FlexColumnWidth(),
                            },
                            children: [
                              TableRow(
                                decoration:
                                    BoxDecoration(color: AppColors.halfWhite2),
                                children: [
                                  SizedBox(),
                                  // Empty space for the checkbox header
                                  CustomTextWidget(
                                    text: "ID",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "DATE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "PRODUCT NAME",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "ORDER VALUE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "OWNER",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "STATUS",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "WORKFLOW SCORE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "PERFORMANCE SCORE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "ACTION",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: historyController.boolList.length,
                          separatorBuilder: (context, index) => CustomDivider(),
                          itemBuilder: (context, index) {
                            return Container(
                              width: AppSizes().getWidthPercentage(100),
                              padding: AppSizes().getCustomPadding(
                                  top: 2.5, bottom: 2.5, right: 1, left: 0),
                              child: Table(
                                columnWidths: const <int, TableColumnWidth>{
                                  0: FixedColumnWidth(50),
                                  // Adjust checkbox width
                                  1: FlexColumnWidth(),
                                  2: FlexColumnWidth(),
                                  3: FlexColumnWidth(),
                                  4: FlexColumnWidth(),
                                  5: FlexColumnWidth(),
                                  6: FlexColumnWidth(),
                                  7: FlexColumnWidth(),
                                  8: FlexColumnWidth(),
                                  9: FlexColumnWidth(),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      Obx(
                                        () => Checkbox(
                                          value: historyController
                                              .boolList[index].value,
                                          onChanged: (value) {
                                            historyController.toggleCheckbox(
                                                index, value);
                                          },
                                          activeColor: AppColors.lightPrimary,
                                          checkColor: AppColors.tertiary,
                                        ),
                                      ),
                                      CustomTextWidget(
                                        text: "#0001",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        text: "DATE",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        text: "PRODUCT NAME",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        text: "ORDER VALUE",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        text: "OWNER",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        text: "STATUS",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        text: "3 Hrs, 20mins",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
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
                                          historyController
                                              .selectedIndex.value = 1;
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Gap(18),
                        CustomPaginationClass(),
                        Gap(18)
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
