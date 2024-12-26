import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Processes/field_generator_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Widgets/custom_text_widget.dart';
import 'package:get/get.dart';

class FieldGeneratorScreen extends StatelessWidget {
  OverlayEntry? overlayEntry;
  FieldGeneratorScreen({super.key, required this.overlayEntry});

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
          body: Padding(
            padding: AppSizes().getCustomPadding(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gap(22),
                Container(
                  width: AppSizes().getWidthPercentage(100),
                  padding: EdgeInsets.all(12),
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.brown.withOpacity(0.06),
                            blurRadius: 5,
                            spreadRadius: 3)
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Estimator Input Value",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(66),
                      GestureDetector(
                        onTap: () {
                          fieldGeneratorController.openFieldGeneratorEstimatorInputScreen(context);
                          overlayEntry?.remove();
                        },
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_sharp,
                                color: AppColors.black),
                            Gap(18),
                            CustomTextWidget(
                              text: "Add Fields",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(20),
                Container(
                  width: AppSizes().getWidthPercentage(100),
                  padding: EdgeInsets.all(12),
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.brown.withOpacity(0.06),
                            blurRadius: 5,
                            spreadRadius: 3)
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Base Calculation Values",
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(66),
                      GestureDetector(
                        onTap: () {
                          fieldGeneratorController.openFieldGeneratorBasicCalculationScreen(context);
                        },
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_sharp,
                                color: AppColors.black),
                            Gap(18),
                            CustomTextWidget(
                              text: "Add Fields",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}