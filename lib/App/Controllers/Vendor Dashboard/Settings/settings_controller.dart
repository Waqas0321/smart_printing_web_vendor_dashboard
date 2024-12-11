import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Employee%20Details/employee_details_main.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/processes_Screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/processes_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Product%20Details/product_details_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Product%20Details/products_details_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/setting_main_screen.dart';
import '../../../Views/Vendor Dashboard/Setting/Employee Details/employees_details_screen.dart';

class SettingsController extends GetxController{
  RxInt selectedIndex = 0.obs;
  RxBool otherScreen = false.obs;

  final List<Widget> screens = [
    SettingsMainScreen(),
    EmployeeDetailsMainScreen(),
    ProductDetailsMainScreen(),
    ProcessesMainScreen()
  ].obs;

}