import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Product_Details/product_details_controller.dart';
import 'package:smart_printing_web/App/Models/product_model.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import '../../../../Models/get_catagory_model.dart';
import '../../../../Services/image_picker_services.dart';

class AddProductController extends GetxController {
  final productDetailsController = Get.put(ProductDetailsController());
  ApiServices apiServices = ApiServices();
  final imageService = Get.put(ImagePickerService());
  Rx<File?> selectedImage = Rx<File?>(null);

  /// Text field Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController skuController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController incomeAmountController = TextEditingController();

  ///check boxes
  void toggleCheckbox(bool? value) {
    includeTax.value = value ?? false;
  }

  void toggleCheckboxPurchase(bool? value) {
    frmSup.value = value ?? false;
  }

  /// Convert from String to double
  double convertTextToDouble(String text) {
    try {
      return double.parse(text);
    } catch (e) {
      print("Error converting text to double: $e");
      return 0.0;
    }
  }

  /// Product Image
  RxInt selectedIncomeAccount = 403.obs;
  RxString selectedTax = "1000".obs;

  /// Select field
  RxString selectedOption = "Non-Inventory".obs;

  /// Get Catagory
  RxBool includeTax = false.obs;
  RxBool frmSup = false.obs;
  var categories = <GetCategoryModel>[].obs;
  var selectedCategory = Rx<GetCategoryModel?>(null);
  var isLoading = true.obs;

  /// Fetch Categories
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      const url = '/vendor/getCategories';
      final fetchedCategories = await apiServices.getCategories(url);
      categories.assignAll(fetchedCategories);
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// Select any Categories
  void selectCategory(GetCategoryModel? category) {
    selectedCategory.value = category;
  }
  final RxBool isPosting = false.obs;
  Future<void> addProduct() async {
    try {
      isPosting.value = true;
      ProductModel productModel = ProductModel(
        img: imageService.selectedImage.value,
        name: nameController.text.trim(),
        sku: skuController.text.trim(),
        cat: [selectedCategory.value?.name ?? ''],
        desc: descriptionController.text.trim(),
        rate: convertTextToDouble(rateController.text.trim()),
        incm: selectedIncomeAccount.value.toString(),
        inclTax: includeTax.value,
        tax: convertTextToDouble(selectedTax.value),
        frmSup: frmSup.value,
      );

      await apiServices.postProduct("/vendor/add-product", productModel);

    } catch (e) {
      print("Exception: $e");
    } finally {
      resetFormFields();
      isPosting.value = false;

    }
  }




  void resetFormFields() {
    selectedImage.value = null;
    nameController.clear();
    skuController.clear();
    selectedCategory = Rx<GetCategoryModel?>(null);
    descriptionController.clear();
    rateController.clear();
    selectedIncomeAccount.value = 403;
    selectedTax.value = "1000";
    includeTax.value = false;
    frmSup.value = false;
    selectedImage = Rx<File?>(null);
    imageService.selectedImage = Rx<File?>(null);
    productDetailsController.selectedIndexProducts.value = 0;
  }


}
