import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Employee%20Details/emplyees_details_controller.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Models/get_employee_model.dart';
import 'package:smart_printing_web/App/Utils/Const/app_images.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_outline_button.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';
import '../../../../Controllers/Vendor Dashboard/Settings/settings_controller.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_icons.dart';
import '../../../../Widgets/custom_container_button.dart';
import '../../../../Widgets/custom_pagination_class.dart';

class EmployeesDetailsScreen extends StatelessWidget {
  const EmployeesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeesDetailsController employeesDetailsController =
        Get.put(EmployeesDetailsController());
    final settingController = Get.put(SettingsController());
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
                    children: [
                      InkWell(
                          onTap: () {
                            settingController.selectedIndex.value = 0;
                          },
                          child: Icon(Icons.arrow_back_ios_outlined)),
                      Gap(12),
                      CustomTextWidget(
                        text: "Employee Details",
                        fontSize: 22,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: AppIcons.downloadIcon,
                        text: "Export",
                        hasRightIcon: false,
                        onPress: () {},
                      ),
                      Gap(8),
                      CustomContainerButton(
                        leftIcon: AppIcons.addOutlineIcon,
                        containerColor: AppColors.lightPrimary,
                        isLarge: isLarge,
                        hasRightIcon: false,
                        text: "Add Employee",
                        onPress: () {
                          employeesDetailsController
                              .selectedIndexEmployee.value = 1;
                        },
                      )
                    ],
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
                        icon: AppIcons.swapIcon,
                      ),
                      Gap(8),
                      CustomOutlinedButton(
                        onPressed: () {},
                        isLarge: isLarge,
                        hasJustIcon: true,
                        iconColor: AppColors.primary,
                        isCircular: true,
                        icon: AppIcons.editIcon,
                      ),
                      Gap(8),
                      CustomOutlinedButton(
                        onPressed: () {},
                        isLarge: isLarge,
                        hasJustIcon: true,
                        iconColor: AppColors.red,
                        isCircular: true,
                        icon: AppIcons.deleteIcon,
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
                                color: AppColors.brown.withOpacity(0.06),
                                blurRadius: 5,
                                spreadRadius: 3)
                          ]),
                      child: Column(
                        children: [
                          // Static Header Table
                          Container(
                            width: AppSizes().getWidthPercentage(100),
                            padding: AppSizes().getCustomPadding(
                                top: 2, bottom: 2, right: 1, left: 1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: AppColors.halfWhite2,
                            ),
                            child: Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(18), // Checkbox
                                1: FlexColumnWidth(1), // ID
                                2: FixedColumnWidth(60), // Picture
                                3: FlexColumnWidth(2), // Employee Name
                                4: FlexColumnWidth(1.5), // Position
                                5: FlexColumnWidth(1.5), // Workflow Score
                                6: FlexColumnWidth(1.5), // Performance Score
                              },
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(
                                      color: AppColors.halfWhite2),
                                  children: [
                                    SizedBox(),
                                    // Empty cell for checkbox header
                                    for (String header in [
                                      "ID",
                                      "PICTURE",
                                      "EMPLOYEE NAME",
                                      "POSITION",
                                      "WORKFLOW SCORE",
                                      "PERFORMANCE SCORE"
                                    ])
                                      CustomTextWidget(
                                        text: header,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Gap(12),

                          // Dynamic Data Table using FutureBuilder
                          FutureBuilder(
                            future: employeesDetailsController.fetchEmployees(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return ListView.separated(
                                  itemCount: 8,
                                  // Placeholder item count
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Table(
                                      defaultVerticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                      columnWidths: const <int,
                                          TableColumnWidth>{
                                        0: FixedColumnWidth(25),
                                        1: FlexColumnWidth(1),
                                        2: FixedColumnWidth(50),
                                        3: FlexColumnWidth(2),
                                        4: FlexColumnWidth(1.5),
                                        5: FlexColumnWidth(1.5),
                                        6: FlexColumnWidth(1.5),
                                      },
                                      children: [
                                        TableRow(
                                          decoration: BoxDecoration(
                                              color: AppColors.white),
                                          children: [
                                            Container(
                                              height: 25,
                                              width: 25,
                                              color: Colors.grey.shade300,
                                            ),
                                            Container(
                                              height: 15,
                                              color: Colors.grey.shade300,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                            ),
                                            CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                                  Colors.grey.shade300,
                                            ),
                                            Container(
                                              height: 15,
                                              color: Colors.grey.shade300,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                            ),
                                            Container(
                                              height: 15,
                                              color: Colors.grey.shade300,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                            ),
                                            Container(
                                              height: 15,
                                              color: Colors.grey.shade300,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                            ),
                                            Container(
                                              height: 15,
                                              color: Colors.grey.shade300,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 5),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return CustomDivider();
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error,
                                          color: AppColors.red, size: 40),
                                      Gap(10),
                                      CustomTextWidget(
                                        text: "Something went wrong!",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        textColor: AppColors.red,
                                      ),
                                      Gap(10),
                                      CustomTextButton(
                                        color: AppColors.lightPrimary,
                                        text: " Retry ",
                                        hasBorder: false,
                                        textColor: AppColors.white,
                                        onPress: () {
                                          employeesDetailsController
                                              .fetchEmployees();
                                        },
                                      )
                                    ],
                                  ),
                                );
                              } else if (snapshot.hasData ||
                                  snapshot.data!.isNotEmpty) {
                                final employees = snapshot.data!;
                                return Column(
                                  children: [
                                    ListView.separated(
                                      itemCount: employees.length,
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Table(
                                          defaultVerticalAlignment:
                                              TableCellVerticalAlignment.middle,
                                          columnWidths: const <int,
                                              TableColumnWidth>{
                                            0: FixedColumnWidth(25),
                                            1: FlexColumnWidth(1),
                                            2: FixedColumnWidth(50),
                                            3: FlexColumnWidth(2),
                                            4: FlexColumnWidth(1.5),
                                            5: FlexColumnWidth(1.5),
                                            6: FlexColumnWidth(1.5),
                                          },
                                          children: [
                                            TableRow(
                                              decoration: BoxDecoration(
                                                  color: AppColors.white),
                                              children: [
                                                Obx(() => Checkbox(
                                                      value:
                                                          employeesDetailsController
                                                              .boolList[index]
                                                              .value,
                                                      onChanged: (value) {
                                                        employeesDetailsController
                                                            .toggleCheckbox(
                                                                index, value);
                                                      },
                                                      activeColor: AppColors
                                                          .lightPrimary,
                                                      checkColor:
                                                          AppColors.tertiary,
                                                    )),
                                                CustomTextWidget(
                                                  text:
                                                      "#${employees[index].id}",
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                    employees[index]
                                                        .profileImage,
                                                  ),
                                                ),
                                                CustomTextWidget(
                                                  text: employees[index].name,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                                CustomTextWidget(
                                                  text:
                                                      employees[index].position,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                                CustomTextWidget(
                                                  text: employees[index]
                                                      .workflowScore
                                                      .toString(),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                                CustomTextWidget(
                                                  text: employees[index]
                                                      .performanceScore
                                                      .toString(),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  textColor: AppColors.brown,
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return CustomDivider();
                                      },
                                    ),
                                    Gap(18),
                                    CustomPaginationClass(),
                                    Gap(18)
                                  ],
                                );
                              } else {
                                return Center(
                                  child: CustomTextWidget(
                                    text: "No data available.",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: AppColors.red,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
