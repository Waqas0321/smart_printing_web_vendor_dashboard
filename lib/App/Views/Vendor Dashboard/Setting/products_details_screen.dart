import 'package:flutter/material.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/product_details_controller.dart';
import 'package:get/get.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsController productDetailsController =
        Get.put(ProductDetailsController());
    return const Center(
      child: Text(
        "Products Screen",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
