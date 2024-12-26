import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
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
                text: "Choose Values Type",
                fontWeight: FontWeight.w600,
                fontSize: 16,
                textColor: AppColors.black,
              ),
            ),
            body: ScrollConfiguration(
              behavior: ScrollBehavior()
                  .copyWith(scrollbars: false, overscroll: false),
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppSizes().getCustomPadding(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        text: "Pre-made Values",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        textColor: AppColors.black,
                      ),
                      Gap(22),
                      Padding(
                        padding: AppSizes().getCustomPadding(left: 3),
                        child: Obx(() => ListView.builder(
                              shrinkWrap: true,
                              itemCount: fieldGeneratorController
                                  .estimatorPreMadeItems.length,
                              itemBuilder: (context, index) {
                                final item = fieldGeneratorController
                                    .estimatorPreMadeItems[index];
                                return GestureDetector(
                                  onTap: () {
                                    fieldGeneratorController
                                        .navigateToScreen(item.title,context);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextWidget(
                                            text: item.title,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            textColor: AppColors.black,
                                          ),
                                          CustomTextWidget(
                                            text: item.subtitle!,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            textColor: AppColors.black,
                                          ),
                                        ],
                                      ),
                                      Gap(12),
                                      CustomDivider(
                                        color: AppColors.lightPrimary,
                                        thickness: 4,
                                      ),
                                      Gap(32),
                                    ],
                                  ),
                                );
                              },
                            )),
                      ),
                      Gap(18),
                      CustomTextWidget(
                        text: "Input Values With Base Calculation",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        textColor: AppColors.black,
                      ),
                      Gap(40),
                      Padding(
                        padding: AppSizes().getCustomPadding(left: 3),
                        child: Obx(() => ListView.builder(
                              shrinkWrap: true,
                              itemCount: fieldGeneratorController
                                  .estimatorBaseCalculationItems.length,
                              itemBuilder: (context, index) {
                                final item = fieldGeneratorController
                                    .estimatorBaseCalculationItems[index];
                                return GestureDetector(
                                  onTap: () {
                                    fieldGeneratorController
                                        .navigateToScreen(item.subtitle!,context);
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextWidget(
                                            text: item.title,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            textColor: AppColors.black,
                                          ),
                                        ],
                                      ),
                                      Gap(12),
                                      CustomDivider(
                                        color: AppColors.lightPrimary,
                                        thickness: 4,
                                      ),
                                      Gap(32),
                                    ],
                                  ),
                                );
                              },
                            )),
                      ),
                      Gap(18),
                      CustomTextWidget(
                        text: "Input Values",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        textColor: AppColors.black,
                      ),
                      Gap(40),
                      Padding(
                        padding: AppSizes().getCustomPadding(left: 3),
                        child: Obx(() => ListView.builder(
                              shrinkWrap: true,
                              itemCount: fieldGeneratorController
                                  .estimatorInputValuesItems.length,
                              itemBuilder: (context, index) {
                                final item = fieldGeneratorController
                                    .estimatorInputValuesItems[index];
                                return GestureDetector(
                                  onTap: () {
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextWidget(
                                            text: item.title,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            textColor: AppColors.black,
                                          ),
                                        ],
                                      ),
                                      Gap(12),
                                      CustomDivider(
                                        color: AppColors.lightPrimary,
                                        thickness: 4,
                                      ),
                                      Gap(32),
                                    ],
                                  ),
                                );
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
