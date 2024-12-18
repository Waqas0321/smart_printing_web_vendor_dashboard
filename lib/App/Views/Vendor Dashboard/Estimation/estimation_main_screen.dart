import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Estimation/estimation_controller.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Estimation/estimation_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Estimation/reply_screen.dart';
import '../../../Utils/Const/app_sizes.dart';

class EstimationMainScreen extends StatelessWidget {
  const EstimationMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final estimationController = Get.put(EstimationController());
    return WillPopScope(
      onWillPop: () async {
        if (estimationController.selectedIndex.value > 0) {
          estimationController.selectedIndex.value = 0;
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
              index: estimationController.selectedIndex.value,
              children: [
                EstimationScreen(),
                ReplyScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
