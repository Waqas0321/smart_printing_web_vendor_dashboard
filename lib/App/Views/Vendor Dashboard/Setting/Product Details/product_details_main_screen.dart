import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Product_Details/product_details_controller.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Product%20Details/products_details_screen.dart';
import '../../../../Utils/Const/app_sizes.dart';

class ProductDetailsMainScreen extends StatelessWidget {
  const ProductDetailsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productDetailsController = Get.put(ProductDetailsController());
    return WillPopScope(
      onWillPop: () async {
        if (productDetailsController.selectedIndexProducts.value > 0) {
          productDetailsController.selectedIndexProducts.value = 0;
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
              index: productDetailsController.selectedIndexProducts.value,
              children: [
                ProductsDetailsScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
