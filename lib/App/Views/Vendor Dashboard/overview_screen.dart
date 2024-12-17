import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/overview_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_pagination_class.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
import '../../Widgets/custom_chart.dart';
import '../../Widgets/custom_divider.dart';
import '../../Widgets/custom_overview_container.dart';
import '../../Widgets/custom_text_widget.dart';

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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CustomOverViewContainer(
                                        iconPath: AppIcons.threeUsers,
                                        isLarge: isLarge,
                                        heading: "4,230",
                                        subContainerText: "+1.5%",
                                        subContainerColor: AppColors.blue,
                                        subHeading: "Total Orders",
                                      ),
                                    ),
                                    Gap(AppSizes().getWidthPercentage(1)),
                                    Expanded(
                                      child: CustomOverViewContainer(
                                        iconPath: AppIcons.document,
                                        isLarge: isLarge,
                                        heading: "40,230",
                                        subContainerText: "+10.5%",
                                        subContainerColor: AppColors.orange,
                                        subHeading: "Total Earnings",
                                      ),
                                    ),
                                    Gap(AppSizes().getWidthPercentage(1)),
                                    Expanded(
                                      child: CustomOverViewContainer(
                                        isLarge: isLarge,
                                        iconPath: AppIcons.wallet,
                                        heading: "Struggled",
                                        subContainerText: "+3.9%",
                                        subContainerColor: AppColors.red,
                                        subHeading: "Avg Performance Score : 8",
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(23),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CustomChart(
                                        overviewController: overviewController,
                                        bloodGlucoseData:
                                            overviewController.bloodGlucoseData,
                                        bloodPressureData: overviewController
                                            .bloodPressureData,
                                        temperatureData:
                                            overviewController.temperatureData,
                                        width:
                                            AppSizes().getWidthPercentage(60),
                                        height:
                                            AppSizes().getHeightPercentage(55),
                                      ),
                                    ),
                                    Gap(12),
                                    Expanded(
                                      flex: 1,
                                      child: CustomChart(
                                        overviewController: overviewController,
                                        hasOneLine: true,
                                        singleLineList: overviewController
                                            .bloodPressureData,
                                        width:
                                            AppSizes().getWidthPercentage(20),
                                        height:
                                            AppSizes().getHeightPercentage(55),
                                      ),
                                    ),
                                  ],
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
                              Gap(23),
                              Column(
                                children: [
                                  CustomChart(
                                    overviewController: overviewController,
                                    bloodGlucoseData:
                                        overviewController.bloodGlucoseData,
                                    bloodPressureData:
                                        overviewController.bloodPressureData,
                                    temperatureData:
                                        overviewController.temperatureData,
                                    width: AppSizes().getWidthPercentage(90),
                                    height: AppSizes().getHeightPercentage(55),
                                  ),
                                  Gap(12),
                                  CustomChart(
                                    hasOneLine: true,
                                    overviewController: overviewController,
                                    singleLineList:
                                        overviewController.temperatureData,
                                    width: AppSizes().getWidthPercentage(90),
                                    height: AppSizes().getHeightPercentage(55),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextWidget(
                              text: "Best Selling Products",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              textColor: AppColors.black,
                            ),
                            SizedBox(
                                width: AppSizes().getWidthPercentage(20),
                                child: CustomTextField(
                                    hintFontSize: 12,
                                    hintText: "Search",
                                    hasPrefixIcon: true,
                                    borderRadius: 6,
                                    controller:
                                        overviewController.searchController))
                          ],
                        ),
                        Gap(12),
                        Container(
                          width: AppSizes().getWidthPercentage(100),
                          padding: AppSizes().getCustomPadding(
                              top: 2.5, bottom: 2.5, right: 1, left: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: AppColors.halfWhite2,
                          ),
                          child: Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(4), // Checkbox column
                              1: FlexColumnWidth(1),
                              2: FlexColumnWidth(2),
                              3: FlexColumnWidth(2),
                              4: FlexColumnWidth(2),
                              5: FlexColumnWidth(2),
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  color: AppColors.halfWhite2,
                                ),
                                children: [
                                  SizedBox(), // Empty placeholder for checkbox
                                  CustomTextWidget(
                                    text: "ID",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    textOverflow: TextOverflow.ellipsis,
                                    text: "PRODUCT NAME",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    textOverflow: TextOverflow.ellipsis,
                                    text: "TOTAL EARNING",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    textOverflow: TextOverflow.ellipsis,
                                    text: "AVG PERFORMANCE SCORE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    textOverflow: TextOverflow.ellipsis,
                                    text: "AVG WORKFLOW STATUS",
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
                          itemCount: overviewController.boolList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(10), // Checkbox column
                                1: FlexColumnWidth(1),
                                2: FlexColumnWidth(2),
                                3: FlexColumnWidth(2),
                                4: FlexColumnWidth(2),
                                5: FlexColumnWidth(2),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    Obx(
                                      () => Checkbox(
                                        value: overviewController
                                            .boolList[index].value,
                                        onChanged: (value) {
                                          overviewController.toggleCheckbox(
                                              index, value);
                                        },
                                        activeColor: AppColors.lightPrimary,
                                        checkColor: AppColors.tertiary,
                                      ),
                                    ),
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


