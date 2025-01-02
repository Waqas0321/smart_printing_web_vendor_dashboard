import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Models/get_product_model.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Product%20Details/product_details_main_screen.dart';


class ProductDetailsController extends GetxController{
  //check box
  List<RxBool> boolList = List.generate(10, (_) => false.obs);

  void toggleCheckbox(int index, bool? value) {
    if (index >= 0 && index < boolList.length) {
      boolList[index].value = value ?? false;
    }
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

