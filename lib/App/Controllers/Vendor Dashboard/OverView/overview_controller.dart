import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OverviewController extends GetxController {
  TextEditingController searchController = TextEditingController();

  //check box
  List<RxBool> boolList = List.generate(10, (_) => false.obs);

  void toggleCheckbox(int index, bool? value) {
    if (index >= 0 && index < boolList.length) {
      boolList[index].value = value ?? false;
    }
  }

  //chart One data and Chart two data
  RxInt selectedMonths = 6.obs;
  RxInt selectedMonth = 1.obs;
  RxList<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ].obs;
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
