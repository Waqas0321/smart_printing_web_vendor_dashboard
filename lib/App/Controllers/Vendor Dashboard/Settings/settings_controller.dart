import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/setting_main_screen.dart';
import '../../../Views/Vendor Dashboard/Setting/employees_details_screen.dart';

class SettingsController extends GetxController{
  RxInt selectedIndex = 0.obs;
  RxBool otherScreen = false.obs;

  final List<Widget> screens = [
    SettingsMainScreen(),
    EmployeesDetailsScreen(),
    Center(child: Text("Products Screen")),
    Center(child: Text("Processes Screen")),
  ].obs;

}