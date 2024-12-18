import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/OverView/overview_controller.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_text_widget.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({
    super.key,
    required this.height,
    required this.width,
    this.overviewController,
  });

  final double height;
  final double width;
  final OverviewController? overviewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes().getCustomPadding(top: 4,left: 1,right: 1),
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
                spreadRadius: 3
            )
          ]
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  child: CustomTextWidget(
                    text: 'Revenue Report',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    textColor: AppColors.black,
                  ),
                ),
                Gap(24),
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
                Gap(AppSizes().getWidthPercentage(8)),
                Obx(
                      () => Container(
                        height: 35,
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                        decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: overviewController!.selectedMonths.value,
                        items: [3, 6, 9, 12]
                            .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text('$value Months'),
                        ))
                            .toList(),
                        onChanged: (value) {
                          overviewController!.selectedMonths.value = value!;
                        },
                      ),
                                        ),
                                      ),
                ),
              ],
            ),
          ),
          Gap(18),
          Expanded(
            child: Obx(
                  () => LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30, // Adjust this value based on the width you want to allocate
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          int index = value.toInt();
                          if (index >= 0 && index < overviewController!.selectedMonths.value) {
                            // Display month name based on selected months
                            return Text(
                              overviewController!.months[index % overviewController!.months.length],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
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
                  minY: 0,
                  maxY: 100,
                  lineBarsData: [
                    LineChartBarData(
                      spots: overviewController!.generateData(overviewController!.selectedMonths.value),
                      color: AppColors.red,
                      isCurved: true,
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                    ),
                    LineChartBarData(
                      spots: overviewController!.generateData(overviewController!.selectedMonths.value)
                          .map((e) => FlSpot(e.x, e.y - 2))
                          .toList(),
                      isCurved: true,
                      color: AppColors.blue,
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                    ),
                    LineChartBarData(
                      spots: overviewController!.generateData(overviewController!.selectedMonths.value)
                          .map((e) => FlSpot(e.x, e.y + 2))
                          .toList(),
                      isCurved: true,
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
                ),
              ),
            ),
          ),

        ],
      ),
    );


  }
}
