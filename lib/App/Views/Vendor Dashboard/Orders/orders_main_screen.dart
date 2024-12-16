import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/orders_controller.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Orders/create_order_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Orders/order_details_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Orders/workflow_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Orders/orders_screen.dart';
import '../../../Utils/Const/app_sizes.dart';

class OrdersMainScreen extends StatelessWidget {
  const OrdersMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersController = Get.put(OrdersController());
    return WillPopScope(
      onWillPop: () async {
        if (ordersController.selectedIndex.value > 0) {
          ordersController.selectedIndex.value = 0;
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
              index: ordersController.selectedIndex.value,
              children: [
                OrdersScreen(),
                CreateOrderScreen(),
                OrderDetailsScreen(),
                OverflowScreen()
              ],
            ),
          );
        },
      ),
    );
  }
}
