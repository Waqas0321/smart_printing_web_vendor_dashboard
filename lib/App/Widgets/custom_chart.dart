import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/overview_controller.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_text_widget.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({
    super.key,
    required this.height,
    required this.width,
    this.temperatureData,
    this.bloodPressureData,
    this.bloodGlucoseData,
    this.hasOneLine = false,
    this.singleLineList,
    this.overviewController,
  });

  final double height;
  final List<dynamic>? temperatureData;
  final List<dynamic>? bloodPressureData;
  final List<dynamic>? bloodGlucoseData;
  final List<dynamic>? singleLineList;
  final double width;
  final bool hasOneLine;
  final OverviewController? overviewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes().getCustomPadding(),
      clipBehavior: Clip.antiAlias,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: AppColors.brown.withOpacity(0.06),
                blurRadius: 5,
                spreadRadius: 3)
          ]),
      child: Column(
        children: [
          hasOneLine
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomTextWidget(
                          text: 'Order Overview',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          textColor: AppColors.black,
                        ),
                        Gap(8),
                        Obx(
                          () => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, // Border color
                                width: 1, // Border width
                              ),
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: overviewController!
                                        .selectedMonth.value.isEmpty
                                    ? null
                                    : overviewController!.selectedMonth.value,
                                hint: CustomTextWidget(
                                  text: "Select month",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  textColor: AppColors.brown,
                                ),
                                icon: const Icon(Icons.arrow_drop_down),
                                elevation: 16,
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                dropdownColor: Colors.white,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    overviewController
                                        ?.setSelectedMonth(newValue);
                                  }
                                },
                                items: overviewController?.months
                                    .map<DropdownMenuItem<String>>(
                                        (String month) {
                                  return DropdownMenuItem<String>(
                                    value: month,
                                    child: CustomTextWidget(
                                      text: month,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      textColor: AppColors.brown,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {},
                            child: Icon(
                              CupertinoIcons.ellipsis_vertical,
                              color: AppColors.brown,
                            )),
                        Gap(12),
                        CustomTextWidget(
                          text: '800',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          textColor: AppColors.black,
                        ),
                      ],
                    ),
                  ],
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: 'Revenue Report',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        textColor: AppColors.black,
                      ),
                      Gap(18),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                color: AppColors.blue,
                              ),
                              Gap(4),
                              CustomTextWidget(
                                text: 'Earnings',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                textColor: AppColors.brown,
                              ),
                            ],
                          ),
                          Gap(4),
                          CustomTextWidget(
                            text: '3,345.78k',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            textColor: AppColors.black,
                          ),
                        ],
                      ),
                      Gap(12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                color: AppColors.orange,
                              ),
                              Gap(4),
                              CustomTextWidget(
                                text: 'Invested',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                textColor: AppColors.brown,
                              ),
                            ],
                          ),
                          Gap(4),
                          CustomTextWidget(
                            text: '3,345.78k',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            textColor: AppColors.black,
                          ),
                        ],
                      ),
                      Gap(12),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                color: AppColors.red,
                              ),
                              Gap(4),
                              CustomTextWidget(
                                text: 'Expenses',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                textColor: AppColors.brown,
                              ),
                            ],
                          ),
                          Gap(4),
                          CustomTextWidget(
                            text: '3,345.78k',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            textColor: AppColors.black,
                          ),
                        ],
                      ),
                      Gap(AppSizes().getWidthPercentage(5)),
                      Obx(
                        () => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 1, // Border width
                            ),
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: overviewController!
                                      .noOfSelectedMonth.value.isEmpty
                                  ? null
                                  : overviewController!.noOfSelectedMonth.value,
                              hint: CustomTextWidget(
                                text: "Select months",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                textColor: AppColors.brown,
                              ),
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              dropdownColor: Colors.white,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  overviewController
                                      ?.noOfSelectedMonthFun(newValue);
                                }
                              },
                              items: overviewController?.howMuchMonths
                                  .map<DropdownMenuItem<String>>(
                                      (String month) {
                                return DropdownMenuItem<String>(
                                  value: month,
                                  child: CustomTextWidget(
                                    text: month,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    textColor: AppColors.brown,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true, // Show bottom titles
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 1:
                              return Center(
                                  child: CustomTextWidget(
                                    text: hasOneLine ? "Sep 13" : 'JAN',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: AppColors.brown,
                                  ));
                            case 2:
                              return Center(
                                  child: CustomTextWidget(
                                    text: hasOneLine ? "Sep 14" : 'FEB',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: AppColors.brown,
                                  ));
                            case 3:
                              return Center(
                                  child: CustomTextWidget(
                                    text: hasOneLine ? "Sep 15" : 'MAR',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: AppColors.brown,
                                  ));
                            case 4:
                              return Center(
                                  child: CustomTextWidget(
                                    text: hasOneLine ? "Sep 16" : 'APR',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: AppColors.brown,
                                  ));
                            case 5:
                              return Center(
                                  child: CustomTextWidget(
                                    text: hasOneLine ? "Sep 17" : 'MAY',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: AppColors.brown,
                                  ));
                            case 6:
                              return Center(
                                  child: CustomTextWidget(
                                    text: hasOneLine ? "Sep 18" : 'JUN',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    textColor: AppColors.brown,
                                  ));
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles:hasOneLine? SideTitles(
                        showTitles: true,
                        interval: 25,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return Transform.rotate(
                            angle: 0,
                            child: Center(
                              child: CustomTextWidget(
                                text: "${value.toInt()+100*2}",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                textColor: AppColors.brown,
                              ),
                            ),
                          );
                        },
                      ):SideTitles(showTitles: false),
                    ),


                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // Hide right axis
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // Hide top axis
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                    border: Border.all(
                      color: AppColors.black.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    drawHorizontalLine: true,
                    verticalInterval: 1,
                    horizontalInterval: 20,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: AppColors.brown.withOpacity(0.2),
                      strokeWidth: 1,
                    ),
                  ),
                  minY: 0, // Set minimum Y-axis value
                  maxY: 100, // Set maximum Y-axis value
                  lineBarsData: hasOneLine
                      ? [
                    LineChartBarData(
                      isCurved: true,
                      spots: singleLineList!
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble() + 1, e.value))
                          .toList(),
                      color: AppColors.blue,
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.blue.withOpacity(0.5),
                            Colors.transparent,
                          ],
                          stops: [0, 0.5],
                        ),
                      ),
                    ),
                  ]
                      : [
                    LineChartBarData(
                      lineChartStepData: LineChartStepData(stepDirection: Checkbox.width),
                      isCurved: true,
                      spots: temperatureData!
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble() + 1, e.value))
                          .toList(),
                      color: AppColors.red,
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                    ),
                    LineChartBarData(
                      isCurved: true,
                      spots: bloodPressureData!
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble() + 1, e.value))
                          .toList(),
                      color: AppColors.blue,
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                    ),
                    LineChartBarData(
                      isCurved: true,
                      spots: bloodGlucoseData!
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble() + 1, e.value))
                          .toList(),
                      color: AppColors.orange,
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          return LineTooltipItem(
                            '${spot.y}',
                            GoogleFonts.montserrat(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                    handleBuiltInTouches: true,
                    getTouchedSpotIndicator: (barData, indicators) {
                      return indicators.map((indicator) {
                        return TouchedSpotIndicatorData(
                          FlLine(
                            color: Colors.grey,
                            strokeWidth: 1,
                            dashArray: [6, 3],
                          ),
                          FlDotData(show: false),
                        );
                      }).toList();
                    },
                    touchSpotThreshold: 20,
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
