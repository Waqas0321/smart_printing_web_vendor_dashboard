import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Controllers/Vendor Dashboard/Settings/Processes/field_generator_controller.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Widgets/custom_text_widget.dart';
class FieldGeneratorEstimatorInputValue extends StatelessWidget {
  FieldGeneratorEstimatorInputValue({super.key, required this.overlayEntry});
  OverlayEntry? overlayEntry;

  @override
  Widget build(BuildContext context) {
    final fieldGeneratorController = Get.put(FieldGeneratorController());
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: AppColors.halfWhite2,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            leading: InkWell(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Icon(
                Icons.highlight_remove,
                color: AppColors.black,
                size: 18,
              ),
            ),
            title: CustomTextWidget(
              text: "Field Generator",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              textColor: AppColors.black,
            ),
          ),
          body: Center(
            child: CustomTextWidget(
              text: "Estimator Input Value",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              textColor: AppColors.black,
            ),
          ),
        );
      },
    );
  }
}
