import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/OverView/overview_controller.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_text_widget.dart';

class CustomChartTwo extends StatelessWidget {
  const CustomChartTwo({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      height:35,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Border color
                          width: 1, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(5), // Rounded corners
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          value: overviewController!.selectedMonth.value,
                          icon: Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.brown,),
                          items: List.generate(12, (index) {
                            return DropdownMenuItem(
                              value: index + 1,
                              child: Text(overviewController!.months[index]),
                            );
                          }),
                          onChanged: (value) {
                            overviewController!.selectedMonth.value = value!;
                          },
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
          ),
          Gap(18),
          Expanded(
            child: Obx(
              () {
                int selectedMonth = overviewController!.selectedMonth.value;
                int selectedYear = overviewController!.selectedYear.value;

                List<String> daysOfMonth = overviewController!
                    .getDaysOfMonth(selectedMonth, selectedYear);

                return LineChart(
                  LineChartData(
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: 1,
                          getTitlesWidget: (value, _) {
                            int index = value.toInt();
                            if (index >= 0 && index < daysOfMonth.length) {
                              String monthName = overviewController!.months[
                                  (overviewController!.selectedMonth.value -
                                          1) %
                                      overviewController!.months.length];
                              return Text('$monthName ${daysOfMonth[index]}');
                            }
                            return SizedBox.shrink();
                          },
                        ),
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
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: AppColors.brown.withOpacity(0.2),
                          strokeWidth: 1,
                          dashArray: [6, 3], // Dash pattern (6px line, 3px gap)
                        );
                      },
                    ),
                    minY: 0,
                    maxY: 100,
                    lineBarsData: [
                      LineChartBarData(
                        spots: overviewController!
                            .generateDataForMonth(daysOfMonth.length),
                        isCurved: true,
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
                      )
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
