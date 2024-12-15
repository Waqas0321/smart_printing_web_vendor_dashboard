import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Employee%20Details/add%20_emloyee_controller.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Employee%20Details/add_employee_details_two.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Employee%20Details/add_employee_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Employee%20Details/add_employee_three_screen.dart';
import '../../../../Utils/Const/app_sizes.dart';
import 'employees_details_screen.dart';

class AddEmployeeMainScreen extends StatelessWidget {
  const AddEmployeeMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addEmployeeController = Get.put(AddEmployeeController());
    return WillPopScope(
      onWillPop: () async {
        if (addEmployeeController.selectedIndexEmployee.value > 0) {
          addEmployeeController.selectedIndexEmployee.value = 0;
          return false;
        } else {
          return true;
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLarge = AppSizes().isDesktop();
          return Obx(
                () => IndexedStack(
              index: addEmployeeController.selectedIndexEmployee.value,
              children: [
                AddEmployeeScreen(),
                AddEmployeeDetailsTwo(),
                AddEmployeeThreeScreen()
              ],
            ),
          );
        },
      ),
    );
  }
}
