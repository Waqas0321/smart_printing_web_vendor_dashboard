import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class OverviewController extends GetxController{
  TextEditingController searchController = TextEditingController();

  //check box
  List<RxBool> boolList = List.generate(10, (_) => false.obs);


  void toggleCheckbox(int index, bool? value) {
    if (index >= 0 && index < boolList.length) {
      boolList[index].value = value ?? false;
    }
  }





  //chart data
  RxList<double> temperatureData = [20.0, 90.0, 30.0, 50.0, 70.0, 40.0].obs;
  RxList<double> bloodPressureData = [50.0, 70.0, 50.0, 70.0, 50.0, 70.0].obs;
  RxList<double> bloodGlucoseData = [60.0, 30.0, 70.0, 30.0, 90.0, 20.0].obs;
  RxInt selectedMonths = 6.obs;
  RxInt selectedMonth = 6.obs;

  final List<String> months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  List<FlSpot> generateData(int length) {
    Random random = Random();
    List<FlSpot> data = [];
    for (int i = 0; i < length; i++) {
      double x = i.toDouble();
      double sinusoidalValue = sin(x / 2) * 40 + 40;
      double randomOffset = (random.nextDouble() * 20) - 10;
      double y = (sinusoidalValue + randomOffset).clamp(20.0, 80.0);

      data.add(FlSpot(x, y));
    }

    return data;
  }

  // Chart two data
  RxInt selectedYear = DateTime.now().year.obs;
  List<FlSpot> generateDataForMonth(int daysInMonth) {
    Random random = Random();
    return List.generate(
      daysInMonth,
          (index) {
        double x = index.toDouble();
        double y = 30 + (sin(x / 2) * 25) + (random.nextDouble() * 10);
        y = y.clamp(20.0, 80.0);
        return FlSpot(x, y);
      },
    );
  }


  List<String> getDaysOfMonth(int month, int year) {
    DateTime firstDay = DateTime(year, month, 1);
    int daysInMonth = DateTime(year, month + 1, 0).day;
    return List.generate(
      4,
          (index) => (index + 10).toString(),
    );
  }


}