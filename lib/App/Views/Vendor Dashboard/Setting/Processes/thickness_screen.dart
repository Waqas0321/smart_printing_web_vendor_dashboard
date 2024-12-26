import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_edit_button.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
import '../../../../Controllers/Vendor Dashboard/Settings/Processes/field_generator_controller.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Widgets/custom_text_widget.dart';

class ThicknessScreen extends StatelessWidget {
  ThicknessScreen({super.key, required this.overlayEntry});

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
          body: ScrollConfiguration(
              behavior: ScrollBehavior()
                  .copyWith(overscroll: false, scrollbars: false),
              child: SingleChildScrollView(
                child: Padding(
                  padding: AppSizes().getCustomPadding(),
                  child: Column(
                    children: [
                      Gap(12),
                      Container(
                        width: AppSizes().getWidthPercentage(100),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.brown.withOpacity(0.06),
                                  blurRadius: 5,
                                  spreadRadius: 3)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomTextWidget(
                                  text: "Estimator input values",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColors.black,
                                ),
                                CustomTextButton(
                                  color: AppColors.lightPrimary,
                                  text: "Submit",
                                  fontSize: 15,
                                  hasBorder: false,
                                  textColor: AppColors.brown,
                                  onPress: () {},
                                )
                              ],
                            ),
                            Gap(12),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.3, color: AppColors.brown),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    text: "Levels with Direct Timer + Percentile",
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    textColor: AppColors.brown,
                                  ),
                                  Gap(32),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                        text: "Thickness",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        textColor: AppColors.black,
                                      ),
                                      Gap(8),
                                      CustomEditButton(
                                        width: 16,
                                        height: 16,
                                      )
                                    ],
                                  ),
                                  Gap(8),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.3, color: AppColors.brown),
                                        borderRadius:
                                        BorderRadius.circular(12)),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Obx(() {
                                          return Wrap(
                                            spacing: 8.0,
                                            runSpacing: 8.0,
                                            children: fieldGeneratorController
                                                .thickness
                                                .asMap()
                                                .entries
                                                .map(
                                                  (entry) => Chip(
                                                backgroundColor:
                                                AppColors.halfWhite2,
                                                label: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    CustomTextWidget(
                                                      text: "Basic Level:  ${entry.value.basicLevel}",
                                                    ),
                                                    Gap(2),
                                                    CustomTextWidget(
                                                      text: "Medium Level:  ${entry.value.mediumLevel}",
                                                    ),
                                                    Gap(2),
                                                    CustomTextWidget(
                                                      text: "Heavy Level:  ${entry.value.heavyLevel}",
                                                    ),
                                                  ],
                                                ),
                                                deleteIcon: Icon(
                                                  Icons.cancel,
                                                  size: 18,
                                                  color: AppColors.brown,
                                                ),
                                                onDeleted: () {
                                                  fieldGeneratorController
                                                      .removeThickness(
                                                      entry.key);
                                                },
                                              ),
                                            )
                                                .toList(),
                                          );
                                        }),
                                        Gap(18),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                height: 34,
                                                child: CustomTextField(
                                                  controller:
                                                  fieldGeneratorController
                                                      .basicLevelController,
                                                  hintText:
                                                  "Basic level",
                                                  hintFontSize: 14,
                                                  borderRadius: 6,
                                                  contentSize: 15,
                                                ),
                                              ),
                                            ),
                                            Gap(6),
                                            Expanded(
                                              child: SizedBox(
                                                height: 34,
                                                child: CustomTextField(
                                                  controller:
                                                  fieldGeneratorController
                                                      .mediumLevelController,
                                                  hintText:
                                                  "Medium level",
                                                  hintFontSize: 14,
                                                  borderRadius: 6,
                                                  contentSize: 15,
                                                ),
                                              ),
                                            ),
                                            Gap(6),
                                            Expanded(
                                              child: SizedBox(
                                                height: 34,
                                                child: CustomTextField(
                                                  controller:
                                                  fieldGeneratorController
                                                      .heavyLevelController,
                                                  hintText:
                                                  "Heavy level",
                                                  hintFontSize: 14,
                                                  borderRadius: 6,
                                                  contentSize: 15,
                                                ),
                                              ),
                                            ),

                                            Gap(AppSizes()
                                                .getWidthPercentage(10)),
                                            CustomTextButton(
                                              color: AppColors.lightPrimary,
                                              text: "Done",
                                              hasBorder: true,
                                              textColor: AppColors.brown,
                                              onPress: () {
                                                fieldGeneratorController
                                                    .addThickness();
                                              },
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Gap(16),
                      Container(
                        width: AppSizes().getWidthPercentage(100),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.brown.withOpacity(0.06),
                              blurRadius: 5,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: "Base Time Calculation",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.black,
                            ),
                            SizedBox(height: 18),
                            Obx(() {
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: fieldGeneratorController
                                    .thickness.length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                            ),
                                            CustomTextButton(
                                              color: AppColors.lightPrimary,
                                              text: "Direct Timer",
                                              hasBorder: false,
                                              textColor: AppColors.brown,
                                              onPress: () {},
                                            ),
                                            Gap(12),
                                            CustomTextButton(
                                              color: AppColors.lightPrimary,
                                              text: "Percentile Timer",
                                              hasBorder: false,
                                              textColor: AppColors.brown,
                                              onPress: () {},
                                            ),
                                            Gap(12)
                                          ],
                                        ),
                                        Gap(6),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomTextWidget(
                                              text: "Option ${index + 1}",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              textColor: AppColors.black,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: 40,
                                                      height: 35,
                                                      child: CustomTextField(
                                                          contentSize: 14,
                                                          borderColor: AppColors
                                                              .lightPrimary,
                                                          borderRadius: 4,
                                                          hintFontSize: 14,
                                                          hintText: "00",
                                                          controller:
                                                          fieldGeneratorController
                                                              .directTier1Controller)),
                                                  Gap(2),
                                                  CustomTextWidget(
                                                    text: ":",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: AppColors.brown,
                                                  ),
                                                  Gap(2),
                                                  SizedBox(
                                                      width: 40,
                                                      height: 35,
                                                      child: CustomTextField(
                                                          contentSize: 14,
                                                          borderColor: AppColors
                                                              .lightPrimary,
                                                          borderRadius: 4,
                                                          hintFontSize: 14,
                                                          hintText: "05",
                                                          controller:
                                                          fieldGeneratorController
                                                              .directTier2Controller)),
                                                  Gap(2),
                                                  CustomTextWidget(
                                                    text: ":",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: AppColors.brown,
                                                  ),
                                                  Gap(2),
                                                  SizedBox(
                                                      width: 40,
                                                      height: 35,
                                                      child: CustomTextField(
                                                          contentSize: 14,
                                                          borderColor: AppColors
                                                              .lightPrimary,
                                                          borderRadius: 4,
                                                          hintFontSize: 14,
                                                          hintText: "00",
                                                          controller:
                                                          fieldGeneratorController
                                                              .directTier3Controller)),
                                                ],
                                              ),
                                            ),
                                            CustomTextWidget(
                                              text: "OR",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              textColor: AppColors.brown,
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                      width: 40,
                                                      height: 35,
                                                      child: CustomTextField(
                                                          contentSize: 14,
                                                          borderColor: AppColors
                                                              .lightPrimary,
                                                          borderRadius: 4,
                                                          hintFontSize: 14,
                                                          hintText: "30",
                                                          controller:
                                                          fieldGeneratorController
                                                              .percentController)),
                                                  Gap(2),
                                                  CustomTextWidget(
                                                    text: "%",
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: AppColors.brown,
                                                  ),
                                                  Gap(12),
                                                  SizedBox(
                                                    width: 200,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Obx(() {
                                                          return Expanded(
                                                            child: ListTile(
                                                              leading: Radio<String>(
                                                                value: "Increase",
                                                                groupValue: fieldGeneratorController.selectedValue.value,
                                                                onChanged: (value) {
                                                                  print(value);
                                                                  if (value != null) {
                                                                    fieldGeneratorController.selectedValue.value = value;
                                                                  }
                                                                },
                                                                activeColor: AppColors.lightPrimary, // Set active color
                                                              ),
                                                              title: CustomTextWidget(
                                                                text: "Increase",
                                                                textColor: AppColors.black,
                                                                fontSize: 10,
                                                              ),
                                                              contentPadding: EdgeInsets.zero, // To align properly
                                                            ),
                                                          );
                                                        }),
                                                        Obx(() {
                                                          return Expanded(
                                                            child: ListTile(
                                                              leading: Radio<String>(
                                                                value: "Decrease",
                                                                groupValue: fieldGeneratorController.selectedValue.value,
                                                                onChanged: (value) {
                                                                  print(value);
                                                                  if (value != null) {
                                                                    fieldGeneratorController.selectedValue.value = value;
                                                                  }
                                                                },
                                                                activeColor: AppColors.lightPrimary, // Set active color
                                                              ),
                                                              title: CustomTextWidget(
                                                                text: "Decrease",
                                                                textColor: AppColors.black,
                                                                fontSize: 10,
                                                              ),
                                                              contentPadding: EdgeInsets.zero, // To align properly
                                                            ),
                                                          );
                                                        }),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }, separatorBuilder: (BuildContext context, int index) { return CustomDivider(); },
                              );
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
