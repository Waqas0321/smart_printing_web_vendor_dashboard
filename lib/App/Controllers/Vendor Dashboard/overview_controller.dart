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
  final temperatureData = [20.0, 90.0, 30.0, 50.0, 70.0, 40.0];
  final bloodPressureData = [50.0, 70.0, 50.0, 70.0, 50.0, 70.0];
  final bloodGlucoseData = [60.0, 30.0, 70.0, 30.0, 90.0, 20.0];
  var selectedMonth = "".obs;
  var noOfSelectedMonth = "".obs;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  List<String> howMuchMonths = [
    '3 Months',
    '6 Months',
    '9 Months',
    '12 Monts',
  ];

  void setSelectedMonth(String month) {
    selectedMonth.value = month;
  }
  void noOfSelectedMonthFun(String howMuchMonths) {
    noOfSelectedMonth.value = howMuchMonths;
  }

}