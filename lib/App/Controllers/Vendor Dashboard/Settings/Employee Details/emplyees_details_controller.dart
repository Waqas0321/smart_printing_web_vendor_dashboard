
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Employee%20Details/add_employee_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Employee%20Details/employee_details_main.dart';

class EmployeesDetailsController extends GetxController{
  //check box
  List<RxBool> boolList = List.generate(10, (_) => false.obs);

  void toggleCheckbox(int index, bool? value) {
    if (index >= 0 && index < boolList.length) {
      boolList[index].value = value ?? false;
    }
  }
  RxInt selectedIndexEmployee = 0.obs;
  final List<Widget> screens = [
    EmployeeDetailsMainScreen(),
    AddEmployeeScreen(),
  ].obs;

}