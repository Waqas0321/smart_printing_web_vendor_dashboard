import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Processes/processes_controller.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/process_builder_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/processes_Screen.dart';
import '../../../../Utils/Const/app_sizes.dart';

class ProcessesMainScreen extends StatelessWidget {
  const ProcessesMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final processesController = Get.put(ProcessesController());
    return WillPopScope(
      onWillPop: () async {
        if (processesController .selectedIndexProcesses.value > 0) {
          processesController .selectedIndexProcesses.value = 0;
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
              index: processesController .selectedIndexProcesses.value,
              children: [
                ProcessesScreen(),
                ProcessBuilderScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
