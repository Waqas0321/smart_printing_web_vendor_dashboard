import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Employee%20Details/employee_details_main.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/processes_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Product%20Details/product_details_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/settings_screen.dart';
import '../../../Controllers/Vendor Dashboard/Settings/settings_controller.dart';
import '../../../Utils/Const/app_sizes.dart';

class SettingsMainScreen extends StatelessWidget {
  const SettingsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return WillPopScope(
      onWillPop: () async {
        if (settingsController.selectedIndex.value > 0) {
          settingsController.selectedIndex.value = 0;
        } else {
          Get.back();
        }
        return false;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLarge = AppSizes().isDesktop();
          return Obx(
            () => IndexedStack(
              index: settingsController.selectedIndex.value,
              children: [
                SettingScreen(),
                EmployeeDetailsMainScreen(),
                ProductDetailsMainScreen(),
                ProcessesMainScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
