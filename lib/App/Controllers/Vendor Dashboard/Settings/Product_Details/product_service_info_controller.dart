import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Product%20Details/product_service_info_screen_two.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_sizes.dart';

class ProductServiceInfoController extends GetxController {
  ApiServices apiServices = ApiServices();

  /// Text field Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController skuController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController catagoryController = TextEditingController();
  TextEditingController taxController = TextEditingController();
  TextEditingController incomeAmountController = TextEditingController();

  ///check boxes
  RxBool purchaseInfo = false.obs;
  RxBool inclusiveTax = false.obs;
  void toggleCheckbox(bool? value) {
    purchaseInfo.value = value ?? false;
  }

  /// Product Image
  RxString imageUrl = "".obs;

  /// Go to Next Overlay Screen
  void openProductServiceInfoTwo(BuildContext context) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              overlayEntry?.remove();
            },
            child: Container(
              color: AppColors.black.withOpacity(0.1),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: AppSizes().getWidthPercentage(30),
            child: ProductServiceInfoScreenTwo(
              overlayEntry: overlayEntry!,
            ),
          ),
        ],
      ),
    );

    Navigator.of(context).overlay?.insert(overlayEntry);
  }
}
