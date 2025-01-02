import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';

class AddProductController extends GetxController {
  ApiServices apiServices = ApiServices();

  /// Text field Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController skuController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController incomeAmountController = TextEditingController();

  ///check boxes
  RxBool purchaseInfo = false.obs;
  RxBool inclusiveTax = false.obs;
  void toggleCheckbox(bool? value) {
    purchaseInfo.value = value ?? false;
  }

  /// Convert from String to double
  double convertTextToDouble(TextEditingController controller) {
    try {
      return double.parse(controller.text.trim());
    } catch (e) {
      print("Error converting text to double: $e");
      return 0.0;
    }
  }

  /// Product Image
  RxString imageUrl = "".obs;
  RxString selectedCategory = "Category 1".obs;
  RxString selectedIncomeAccount = "403 Services".obs;
  RxString selectedTax = "1000".obs;

  /// Select field
  RxString selectedOption = "Non-Inventory".obs;



}
