import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Processes/processes_controller.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import '../../../../Controllers/Vendor Dashboard/Settings/settings_controller.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Widgets/custom_container_button.dart';
import '../../../../Widgets/custom_outline_button.dart';
import '../../../../Widgets/custom_pagination_class.dart';
import '../../../../Widgets/custom_text_widget.dart';

class ProcessesScreen extends StatelessWidget {
  const ProcessesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProcessesController processesController = Get.put(ProcessesController());
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
                        text: "Processes Details",
                        fontSize: 22,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: Icons.login_outlined,
                        text: "Export",
                        hasRightIcon: false,
                        onPress: () {},
                      ),
                      Gap(8),
                      CustomContainerButton(
                        leftIcon: Icons.add_box_outlined,
                        containerColor: AppColors.lightPrimary,
                        isLarge: isLarge,
                        hasRightIcon: false,
                        text: "Process",
                        onPress: () {
                          processesController.selectedIndexProcesses.value = 1;
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
                        icon: CupertinoIcons.down_arrow,
                      ),
                      Gap(6),
                      CustomOutlinedButton(
                        onPressed: () {},
                        isLarge: isLarge,
                        hasJustIcon: true,
                        iconColor: AppColors.primary,
                        isCircular: true,
                        icon: Icons.mode_edit_outline_sharp,
                      ),
                      Gap(6),
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
                          padding: AppSizes().getCustomPadding(top: 2, bottom: 2, right: 1, left: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: AppColors.halfWhite2,
                          ),
                          child: Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(32),   // Checkbox
                              1: FlexColumnWidth(1.5),  // ID
                              2: FlexColumnWidth(2),    // Process Name
                              3: FlexColumnWidth(2),    // No of Machines
                              4: FlexColumnWidth(2),    // Workflow Score
                              5: FlexColumnWidth(2),    // Performance Score
                            },
                            children: [
                              // Table Header
                              TableRow(
                                decoration: BoxDecoration(color: AppColors.halfWhite2),
                                children: [
                                  SizedBox(), // Empty for Checkbox header
                                  CustomTextWidget(
                                    text: "ID",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "PROCESS NAME",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "NO OF MACHINES",
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
                                ],
                              ),
                            ],
                          ),
                        ),
                        Gap(12),
                        ListView.separated(
                          itemCount: processesController.boolList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Table(
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(40),   // Checkbox
                                1: FlexColumnWidth(1.5),  // ID
                                2: FlexColumnWidth(2),    // Process Name
                                3: FlexColumnWidth(2),    // No of Machines
                                4: FlexColumnWidth(2),    // Workflow Score
                                5: FlexColumnWidth(2),    // Performance Score
                              },
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(color: AppColors.white),
                                  children: [
                                    Obx(() => Checkbox(
                                      value: processesController.boolList[index].value,
                                      onChanged: (value) {
                                        processesController.toggleCheckbox(index, value);
                                      },
                                      activeColor: AppColors.lightPrimary,
                                      checkColor: AppColors.tertiary,
                                    )),
                                    CustomTextWidget(
                                      textOverflow: TextOverflow.ellipsis,
                                      text: "#01",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextWidget(
                                      textOverflow: TextOverflow.ellipsis,
                                      text: "Lamination",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextWidget(
                                      textOverflow: TextOverflow.ellipsis,
                                      text: "Dummy name",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextWidget(
                                      textOverflow: TextOverflow.ellipsis,
                                      text: "Smooth",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextWidget(
                                      textOverflow: TextOverflow.ellipsis,
                                      text: "08",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return CustomDivider();
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
