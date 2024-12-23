import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/field_generator_basic_calculation_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/field_generator_estimator_input_screen.dart';

import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_sizes.dart';

class FieldGeneratorController extends GetxController{
  void openFieldGeneratorEstimatorInputScreen(BuildContext context) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              overlayEntry?.remove();
            },
            child: Container(
              color: AppColors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: AppSizes().getWidthPercentage(60),
            child: FieldGeneratorEstimatorInputValue(overlayEntry: overlayEntry,),
          ),
        ],
      ),
    );

    Navigator.of(context).overlay?.insert(overlayEntry);
  }
  void openFieldGeneratorBasicCalculationScreen(BuildContext context) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              overlayEntry?.remove();
            },
            child: Container(
              color: AppColors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: AppSizes().getWidthPercentage(60),
            child: FieldGeneratorBasicCalculationScreen(overlayEntry: overlayEntry,),
          ),
        ],
      ),
    );

    Navigator.of(context).overlay?.insert(overlayEntry);
  }
}