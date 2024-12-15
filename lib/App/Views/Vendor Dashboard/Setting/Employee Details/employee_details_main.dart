import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Employee%20Details/emplyees_details_controller.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Employee%20Details/add_employee_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Employee%20Details/add_emplyee_main.dart';
import '../../../../Utils/Const/app_sizes.dart';
import 'employees_details_screen.dart';

class EmployeeDetailsMainScreen extends StatelessWidget {
  const EmployeeDetailsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeDetailsController = Get.put(EmployeesDetailsController());
    return WillPopScope(
      onWillPop: () async {
        if (employeeDetailsController.selectedIndexEmployee.value > 0) {
          employeeDetailsController.selectedIndexEmployee.value = 0;
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
              index: employeeDetailsController.selectedIndexEmployee.value,
              children: [
                EmployeesDetailsScreen(),
                AddEmployeeMainScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
