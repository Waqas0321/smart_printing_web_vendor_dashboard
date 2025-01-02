import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Models/get_product_model.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Product%20Details/product_details_main_screen.dart';


class ProductDetailsController extends GetxController{
  ///check box
  RxList<String> selectedProductIds = <String>[].obs;
  void toggleSelection(String productId, bool isSelected) {
    if (isSelected) {
      selectedProductIds.add(productId);
    } else {
      selectedProductIds.remove(productId);
    }
    print('Selected Product IDs: ${selectedProductIds}');
  }
  RxInt selectedIndexProducts = 0.obs;
  final List<Widget> screens = [
    ProductDetailsMainScreen(),
  ].obs;

  /// Fetch All Products
  Future<List<GetProduct>> fetchProducts() async {
    String endpoint = "/vendor/getProducts";
    return await ApiServices().getProduct(endpoint);
  }

}

