import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/history_controller.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/History/history_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Orders/workflow_screen.dart';
import '../../../Utils/Const/app_sizes.dart';

class HistoryMainScreen extends StatelessWidget {
  const HistoryMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.put(HistoryController());
    return WillPopScope(
      onWillPop: () async {
        if (historyController.selectedIndex.value > 0) {
          historyController.selectedIndex.value = 0;
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
              index: historyController.selectedIndex.value,
              children: [
                HistoryScreen(),
                OverflowScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
