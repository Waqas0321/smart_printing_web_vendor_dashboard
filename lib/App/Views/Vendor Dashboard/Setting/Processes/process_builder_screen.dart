import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Processes/process_builder_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Processes/processes_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Widgets/custom_container_button.dart';
import '../../../../Widgets/custom_edit_button.dart';
import '../../../../Widgets/custom_footer_data.dart';
import '../../../../Widgets/custom_text_widget.dart';
import '../../../../Widgets/custom_textfield.dart';

class ProcessBuilderScreen extends StatelessWidget {
  const ProcessBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final processesController = Get.put(ProcessesController());
    final processesBuilderController = Get.put(ProcessBuilderController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = AppSizes().isDesktop();
        return Padding(
          padding:
              AppSizes().getCustomPadding(top: 1, bottom: 2, left: 1, right: 1),
          child: ScrollConfiguration(
            behavior:
                ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            processesController.selectedIndexProcesses.value =
                                0;
                          },
                          child: Icon(Icons.arrow_back_ios_outlined)),
                      Gap(12),
                      CustomTextWidget(
                        text: "Process Builder",
                        fontSize: 22,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: AppIcons.downloadIcon,
                        text: "Export",
                        hasRightIcon: false,
                        onPress: () {},
                      ),
                      Gap(6),
                      CustomTextButton(
                       color: AppColors.lightPrimary,
                        hasBorder: false,
                        textColor: AppColors.brown,
                        text: "  Process  ",
                        onPress: () {
                          processesController.selectedIndexProcesses.value = 0;
                        },
                      ),
                    ],
                  ),
                  Gap(18),
                  Container(
                    padding: AppSizes().getCustomPadding(),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.brown.withOpacity(0.06),
                              blurRadius: 5,
                              spreadRadius: 3)
                        ]),
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars: false,
                        overscroll: false,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CustomTextWidget(
                                  textAlign: TextAlign.start,
                                  text: "Process Name: ",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColors.black,
                                ),
                                SizedBox(width: 2),
                                CustomTextWidget(
                                  textAlign: TextAlign.start,
                                  text: "Lamination",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColors.black,
                                ),
                                Spacer(),
                                CustomEditButton(),
                              ],
                            ),
                            SizedBox(height: 43),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  processesBuilderController.expandedFunction();
                                },
                                child: Row(
                                  children: [
                                    CustomTextWidget(
                                      textAlign: TextAlign.start,
                                      text: "Base Calculation Values",
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      textColor: AppColors.black,
                                    ),
                                    Spacer(),
                                    Icon(
                                      processesBuilderController
                                              .isExpanded.value
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomDivider(
                              color: AppColors.lightPrimary,
                              thickness: 4,
                            ),
                            Gap(18),
                            Obx(
                              () => processesBuilderController.isExpanded.value
                                  ? isLarge
                                      ? Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding: AppSizes()
                                                        .getCustomPadding(),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 0.5,
                                                          color:
                                                              AppColors.brown,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomTextWidget(
                                                          textAlign:
                                                              TextAlign.start,
                                                          text:
                                                              "Dimension with Direct Timer",
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              AppColors.black,
                                                        ),
                                                        Gap(12),
                                                        Stack(
                                                          children: [
                                                            CustomTextButton(
                                                              color: AppColors
                                                                  .lightPrimary,
                                                              text: "Base Size",
                                                              hasBorder: false,
                                                              textColor:
                                                                  AppColors
                                                                      .brown,
                                                              onPress: () {},
                                                            ),
                                                            Positioned(
                                                                top: 0,
                                                                right: 0,
                                                                child:
                                                                    CustomEditButton(
                                                                  height: 15,
                                                                  width: 15,
                                                                ))
                                                          ],
                                                        ),
                                                        Gap(12),
                                                        SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                  width: 80,
                                                                  height: 35,
                                                                  child: CustomTextField(
                                                                      borderColor:
                                                                          AppColors
                                                                              .lightPrimary,
                                                                      borderRadius:
                                                                          4,
                                                                      hintFontSize:
                                                                          12,
                                                                      contentSize:
                                                                          12,
                                                                      hintText:
                                                                          "Length",
                                                                      controller:
                                                                          processesBuilderController
                                                                              .lengthController)),
                                                              Gap(4),
                                                              CustomTextWidget(
                                                                text: "X",
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                textColor:
                                                                    AppColors
                                                                        .brown,
                                                              ),
                                                              Gap(2),
                                                              SizedBox(
                                                                  width: 80,
                                                                  height: 35,
                                                                  child: CustomTextField(
                                                                      borderColor:
                                                                          AppColors
                                                                              .lightPrimary,
                                                                      borderRadius:
                                                                          4,
                                                                      hintFontSize:
                                                                          12,
                                                                      contentSize:
                                                                          12,
                                                                      hintText:
                                                                          "Height",
                                                                      controller:
                                                                          processesBuilderController
                                                                              .lengthController)),
                                                              Gap(4),
                                                              CustomTextWidget(
                                                                text: "X",
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                textColor:
                                                                    AppColors
                                                                        .brown,
                                                              ),
                                                              Gap(2),
                                                              SizedBox(
                                                                  width: 80,
                                                                  height: 35,
                                                                  child: CustomTextField(
                                                                      borderColor:
                                                                          AppColors
                                                                              .lightPrimary,
                                                                      borderRadius:
                                                                          4,
                                                                      hintFontSize:
                                                                          12,
                                                                      contentSize:
                                                                          12,
                                                                      hintText:
                                                                          "Depth",
                                                                      controller:
                                                                          processesBuilderController
                                                                              .lengthController)),
                                                              Gap(4),
                                                              CustomTextWidget(
                                                                text: "X",
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                textColor:
                                                                    AppColors
                                                                        .brown,
                                                              ),
                                                              Gap(2),
                                                              SizedBox(
                                                                height: 35,
                                                                width: 100,
                                                                child:
                                                                    DropdownButtonFormField<
                                                                        String>(
                                                                  value: processesBuilderController
                                                                      .selectedType1
                                                                      .value,
                                                                  items: [
                                                                    DropdownMenuItem(
                                                                        value:
                                                                            "Type 1",
                                                                        child: CustomTextWidget(
                                                                            text:
                                                                                "Type 1 ")),
                                                                    DropdownMenuItem(
                                                                        value:
                                                                            "Type 2",
                                                                        child: CustomTextWidget(
                                                                            text:
                                                                                "Type 2 ")),
                                                                    DropdownMenuItem(
                                                                        value:
                                                                            "Type 3",
                                                                        child: CustomTextWidget(
                                                                            text:
                                                                                "Type 3 ")),
                                                                  ],
                                                                  onChanged:
                                                                      (value) {
                                                                    processesBuilderController
                                                                        .selectedType1
                                                                        .value = value!;
                                                                  },
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        "CM",
                                                                    hintStyle: GoogleFonts.montserrat(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            9),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      gapPadding:
                                                                          0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: AppColors.lightPrimary),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      gapPadding:
                                                                          0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: AppColors.lightPrimary),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      gapPadding:
                                                                          0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: AppColors.lightPrimary),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      gapPadding:
                                                                          0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: AppColors.lightPrimary),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Gap(18),
                                                        CustomTextButton(
                                                          color: AppColors
                                                              .lightPrimary,
                                                          text: "Direct Timer",
                                                          hasBorder: false,
                                                          textColor:
                                                              AppColors.brown,
                                                          onPress: () {},
                                                        ),
                                                        Gap(12),
                                                        SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            children: [
                                                              Gap(2),
                                                              SizedBox(
                                                                  width: 50,
                                                                  height: 35,
                                                                  child: CustomTextField(
                                                                      borderColor:
                                                                          AppColors
                                                                              .lightPrimary,
                                                                      borderRadius:
                                                                          4,
                                                                      hintFontSize:
                                                                          12,
                                                                      contentSize:
                                                                          12,
                                                                      hintText:
                                                                          "05",
                                                                      controller:
                                                                          processesBuilderController
                                                                              .lengthController)),
                                                              Gap(2),
                                                              CustomTextWidget(
                                                                text: ":",
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                textColor:
                                                                    AppColors
                                                                        .brown,
                                                              ),
                                                              Gap(2),
                                                              SizedBox(
                                                                  width: 50,
                                                                  height: 35,
                                                                  child: CustomTextField(
                                                                      borderColor:
                                                                          AppColors
                                                                              .lightPrimary,
                                                                      borderRadius:
                                                                          4,
                                                                      hintFontSize:
                                                                          12,
                                                                      contentSize:
                                                                          12,
                                                                      hintText:
                                                                          "00",
                                                                      controller:
                                                                          processesBuilderController
                                                                              .lengthController)),
                                                              Gap(2),
                                                              CustomTextWidget(
                                                                text: ":",
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                textColor:
                                                                    AppColors
                                                                        .brown,
                                                              ),
                                                              Gap(2),
                                                              SizedBox(
                                                                  width: 50,
                                                                  height: 35,
                                                                  child: CustomTextField(
                                                                      borderColor:
                                                                          AppColors
                                                                              .lightPrimary,
                                                                      borderRadius:
                                                                          4,
                                                                      hintFontSize:
                                                                          12,
                                                                      contentSize:
                                                                          12,
                                                                      hintText:
                                                                          "56",
                                                                      controller:
                                                                          processesBuilderController
                                                                              .lengthController)),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Gap(18),
                                                Expanded(
                                                  child: Container(
                                                    padding: AppSizes()
                                                        .getCustomPadding(),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 0.5,
                                                          color:
                                                              AppColors.brown,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomTextWidget(
                                                          textAlign:
                                                              TextAlign.start,
                                                          text: "Faces",
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              AppColors.black,
                                                        ),
                                                        Gap(12),
                                                        Row(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                CustomTextButton(
                                                                  color: AppColors
                                                                      .lightPrimary,
                                                                  text:
                                                                      "Slides",
                                                                  hasBorder:
                                                                      false,
                                                                  textColor:
                                                                      AppColors
                                                                          .brown,
                                                                  onPress:
                                                                      () {},
                                                                ),
                                                                Positioned(
                                                                    top: 0,
                                                                    right: 0,
                                                                    child:
                                                                        CustomEditButton(
                                                                      height:
                                                                          15,
                                                                      width: 15,
                                                                    ))
                                                              ],
                                                            ),
                                                            Gap(22),
                                                            Stack(
                                                              children: [
                                                                CustomTextButton(
                                                                  color: AppColors
                                                                      .lightPrimary,
                                                                  text:
                                                                      "Repitations Per Slides",
                                                                  hasBorder:
                                                                      false,
                                                                  textColor:
                                                                      AppColors
                                                                          .brown,
                                                                  onPress:
                                                                      () {},
                                                                ),
                                                                Positioned(
                                                                    top: 0,
                                                                    right: 0,
                                                                    child:
                                                                        CustomEditButton(
                                                                      height:
                                                                          15,
                                                                      width: 15,
                                                                    ))
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        Gap(18),
                                                        Row(
                                                          children: [
                                                            CustomTextButton(
                                                              color: AppColors
                                                                  .lightPrimary,
                                                              text: "  Yes  ",
                                                              hasBorder: true,
                                                              textColor:
                                                                  AppColors
                                                                      .brown,
                                                              onPress: () {},
                                                            ),
                                                            Gap(19),
                                                            CustomTextButton(
                                                              color: AppColors
                                                                  .lightPrimary,
                                                              text: "   No    ",
                                                              hasBorder: true,
                                                              textColor:
                                                                  AppColors
                                                                      .brown,
                                                              onPress: () {},
                                                            ),
                                                          ],
                                                        ),
                                                        Gap(18),
                                                        Stack(
                                                          children: [
                                                            CustomTextButton(
                                                              color: AppColors
                                                                  .lightPrimary,
                                                              text:
                                                                  "Percentile Timer",
                                                              hasBorder: false,
                                                              textColor:
                                                                  AppColors
                                                                      .brown,
                                                              onPress: () {},
                                                            ),
                                                            Positioned(
                                                                top: 0,
                                                                right: 0,
                                                                child:
                                                                    CustomEditButton(
                                                                  height: 15,
                                                                  width: 15,
                                                                ))
                                                          ],
                                                        ),
                                                        Gap(22),
                                                        SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            children: [
                                                              Gap(2),
                                                              SizedBox(
                                                                  width: 50,
                                                                  height: 35,
                                                                  child: CustomTextField(
                                                                      borderColor:
                                                                          AppColors
                                                                              .lightPrimary,
                                                                      borderRadius:
                                                                          4,
                                                                      hintFontSize:
                                                                          12,
                                                                      contentSize:
                                                                          12,
                                                                      hintText:
                                                                          "05",
                                                                      controller:
                                                                          processesBuilderController
                                                                              .lengthController)),
                                                              Gap(8),
                                                              CustomTextWidget(
                                                                text: "%",
                                                                textColor:
                                                                    AppColors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                              Gap(8),
                                                              SizedBox(
                                                                height: 35,
                                                                width: 100,
                                                                child:
                                                                    DropdownButtonFormField<
                                                                        String>(
                                                                  value: processesBuilderController
                                                                      .selectedType1
                                                                      .value,
                                                                  items: [
                                                                    DropdownMenuItem(
                                                                        value:
                                                                            "Type 1",
                                                                        child: CustomTextWidget(
                                                                            text:
                                                                                "Type 1 ")),
                                                                    DropdownMenuItem(
                                                                        value:
                                                                            "Type 2",
                                                                        child: CustomTextWidget(
                                                                            text:
                                                                                "Type 2 ")),
                                                                    DropdownMenuItem(
                                                                        value:
                                                                            "Type 3",
                                                                        child: CustomTextWidget(
                                                                            text:
                                                                                "Type 3 ")),
                                                                  ],
                                                                  onChanged:
                                                                      (value) {
                                                                    processesBuilderController
                                                                        .selectedType1
                                                                        .value = value!;
                                                                  },
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        "CM",
                                                                    hintStyle: GoogleFonts.montserrat(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            9),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      gapPadding:
                                                                          0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: AppColors.lightPrimary),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      gapPadding:
                                                                          0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: AppColors.lightPrimary),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      gapPadding:
                                                                          0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: AppColors.lightPrimary),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      gapPadding:
                                                                          0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: AppColors.lightPrimary),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Gap(18),
                                            Container(
                                              width: AppSizes()
                                                  .getWidthPercentage(100),
                                              padding:
                                                  AppSizes().getCustomPadding(),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 0.5,
                                                    color: AppColors.brown,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomTextWidget(
                                                    textAlign: TextAlign.start,
                                                    text:
                                                        "Levels with Direct Timer + Percentile Increaments",
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: AppColors.black,
                                                  ),
                                                  Gap(12),
                                                  Stack(
                                                    children: [
                                                      CustomTextButton(
                                                        color: AppColors
                                                            .lightPrimary,
                                                        text: "Thickness",
                                                        hasBorder: false,
                                                        textColor:
                                                            AppColors.brown,
                                                        onPress: () {},
                                                      ),
                                                      Positioned(
                                                          top: 0,
                                                          right: 0,
                                                          child:
                                                              CustomEditButton(
                                                            height: 15,
                                                            width: 15,
                                                          ))
                                                    ],
                                                  ),
                                                  Gap(18),
                                               ScrollConfiguration(
                                                    behavior: ScrollBehavior().copyWith(scrollbars: false,overscroll: false),
                                                    child: SingleChildScrollView(
                                                      scrollDirection: Axis.horizontal,
                                                      child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          CustomFooterData(processesBuilderController: processesBuilderController,text: "Basic Level:"),
                                                          Gap(AppSizes().getWidthPercentage(1.9)),
                                                          CustomVerticalDivider(height: 140,color: AppColors.lightPrimary,thickness: 3,),
                                                          Gap(AppSizes().getWidthPercentage(1.9)),
                                                          CustomFooterData(processesBuilderController: processesBuilderController,text: "Medium Level:"),
                                                          Gap(AppSizes().getWidthPercentage(1.9)),
                                                          CustomVerticalDivider(height: 140,color: AppColors.lightPrimary,thickness: 3,),
                                                          Gap(AppSizes().getWidthPercentage(1.9)),
                                                          CustomFooterData(processesBuilderController: processesBuilderController,text: "Heavy Level:"),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Container(
                                              padding:
                                                  AppSizes().getCustomPadding(),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 0.5,
                                                    color: AppColors.brown,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomTextWidget(
                                                    textAlign: TextAlign.start,
                                                    text:
                                                        "Dimension with Direct Timer",
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: AppColors.black,
                                                  ),
                                                  Gap(12),
                                                  Stack(
                                                    children: [
                                                      CustomTextButton(
                                                        color: AppColors
                                                            .lightPrimary,
                                                        text: "Base Size",
                                                        hasBorder: false,
                                                        textColor:
                                                            AppColors.brown,
                                                        onPress: () {},
                                                      ),
                                                      Positioned(
                                                          top: 0,
                                                          right: 0,
                                                          child:
                                                              CustomEditButton(
                                                            height: 15,
                                                            width: 15,
                                                          ))
                                                    ],
                                                  ),
                                                  Gap(12),
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                            width: 80,
                                                            height: 35,
                                                            child: CustomTextField(
                                                                borderColor:
                                                                    AppColors
                                                                        .lightPrimary,
                                                                borderRadius: 4,
                                                                hintFontSize:
                                                                    12,
                                                                contentSize: 12,
                                                                hintText:
                                                                    "Length",
                                                                controller:
                                                                    processesBuilderController
                                                                        .lengthController)),
                                                        Gap(4),
                                                        CustomTextWidget(
                                                          text: "X",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              AppColors.brown,
                                                        ),
                                                        Gap(2),
                                                        SizedBox(
                                                            width: 80,
                                                            height: 35,
                                                            child: CustomTextField(
                                                                borderColor:
                                                                    AppColors
                                                                        .lightPrimary,
                                                                borderRadius: 4,
                                                                hintFontSize:
                                                                    12,
                                                                contentSize: 12,
                                                                hintText:
                                                                    "Height",
                                                                controller:
                                                                    processesBuilderController
                                                                        .lengthController)),
                                                        Gap(4),
                                                        CustomTextWidget(
                                                          text: "X",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              AppColors.brown,
                                                        ),
                                                        Gap(2),
                                                        SizedBox(
                                                            width: 80,
                                                            height: 35,
                                                            child: CustomTextField(
                                                                borderColor:
                                                                    AppColors
                                                                        .lightPrimary,
                                                                borderRadius: 4,
                                                                hintFontSize:
                                                                    12,
                                                                contentSize: 12,
                                                                hintText:
                                                                    "Depth",
                                                                controller:
                                                                    processesBuilderController
                                                                        .lengthController)),
                                                        Gap(4),
                                                        CustomTextWidget(
                                                          text: "X",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              AppColors.brown,
                                                        ),
                                                        Gap(2),
                                                        SizedBox(
                                                          height: 35,
                                                          width: 100,
                                                          child:
                                                              DropdownButtonFormField<
                                                                  String>(
                                                            value:
                                                                processesBuilderController
                                                                    .selectedType1
                                                                    .value,
                                                            items: [
                                                              DropdownMenuItem(
                                                                  value:
                                                                      "Type 1",
                                                                  child: CustomTextWidget(
                                                                      text:
                                                                          "Type 1 ")),
                                                              DropdownMenuItem(
                                                                  value:
                                                                      "Type 2",
                                                                  child: CustomTextWidget(
                                                                      text:
                                                                          "Type 2 ")),
                                                              DropdownMenuItem(
                                                                  value:
                                                                      "Type 3",
                                                                  child: CustomTextWidget(
                                                                      text:
                                                                          "Type 3 ")),
                                                            ],
                                                            onChanged: (value) {
                                                              processesBuilderController
                                                                  .selectedType1
                                                                  .value = value!;
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: "CM",
                                                              hintStyle: GoogleFonts
                                                                  .montserrat(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          9),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                gapPadding: 0,
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .lightPrimary),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                gapPadding: 0,
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .lightPrimary),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                gapPadding: 0,
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .lightPrimary),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                gapPadding: 0,
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .lightPrimary),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Gap(18),
                                                  CustomTextButton(
                                                    color:
                                                        AppColors.lightPrimary,
                                                    text: "Direct Timer",
                                                    hasBorder: false,
                                                    textColor: AppColors.brown,
                                                    onPress: () {},
                                                  ),
                                                  Gap(12),
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      children: [
                                                        Gap(2),
                                                        SizedBox(
                                                            width: 50,
                                                            height: 35,
                                                            child: CustomTextField(
                                                                borderColor:
                                                                    AppColors
                                                                        .lightPrimary,
                                                                borderRadius: 4,
                                                                hintFontSize:
                                                                    12,
                                                                contentSize: 12,
                                                                hintText: "05",
                                                                controller:
                                                                    processesBuilderController
                                                                        .lengthController)),
                                                        Gap(2),
                                                        CustomTextWidget(
                                                          text: ":",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              AppColors.brown,
                                                        ),
                                                        Gap(2),
                                                        SizedBox(
                                                            width: 50,
                                                            height: 35,
                                                            child: CustomTextField(
                                                                borderColor:
                                                                    AppColors
                                                                        .lightPrimary,
                                                                borderRadius: 4,
                                                                hintFontSize:
                                                                    12,
                                                                contentSize: 12,
                                                                hintText: "00",
                                                                controller:
                                                                    processesBuilderController
                                                                        .lengthController)),
                                                        Gap(2),
                                                        CustomTextWidget(
                                                          text: ":",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              AppColors.brown,
                                                        ),
                                                        Gap(2),
                                                        SizedBox(
                                                            width: 50,
                                                            height: 35,
                                                            child: CustomTextField(
                                                                borderColor:
                                                                    AppColors
                                                                        .lightPrimary,
                                                                borderRadius: 4,
                                                                hintFontSize:
                                                                    12,
                                                                contentSize: 12,
                                                                hintText: "56",
                                                                controller:
                                                                    processesBuilderController
                                                                        .lengthController)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Gap(18),
                                            Container(
                                              padding:
                                                  AppSizes().getCustomPadding(),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 0.5,
                                                    color: AppColors.brown,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomTextWidget(
                                                    textAlign: TextAlign.start,
                                                    text: "Faces",
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: AppColors.black,
                                                  ),
                                                  Gap(12),
                                                  Row(
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          CustomTextButton(
                                                            color: AppColors
                                                                .lightPrimary,
                                                            text: "Slides",
                                                            hasBorder: false,
                                                            textColor:
                                                                AppColors.brown,
                                                            onPress: () {},
                                                          ),
                                                          Positioned(
                                                              top: 0,
                                                              right: 0,
                                                              child:
                                                                  CustomEditButton(
                                                                height: 15,
                                                                width: 15,
                                                              ))
                                                        ],
                                                      ),
                                                      Gap(22),
                                                      Stack(
                                                        children: [
                                                          CustomTextButton(
                                                            color: AppColors
                                                                .lightPrimary,
                                                            text:
                                                                "Repitations Per Slides",
                                                            hasBorder: false,
                                                            textColor:
                                                                AppColors.brown,
                                                            onPress: () {},
                                                          ),
                                                          Positioned(
                                                              top: 0,
                                                              right: 0,
                                                              child:
                                                                  CustomEditButton(
                                                                height: 15,
                                                                width: 15,
                                                              ))
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Gap(18),
                                                  Row(
                                                    children: [
                                                      CustomTextButton(
                                                        color: AppColors
                                                            .lightPrimary,
                                                        text: "  Yes  ",
                                                        hasBorder: true,
                                                        textColor:
                                                            AppColors.brown,
                                                        onPress: () {},
                                                      ),
                                                      Gap(19),
                                                      CustomTextButton(
                                                        color: AppColors
                                                            .lightPrimary,
                                                        text: "   No    ",
                                                        hasBorder: true,
                                                        textColor:
                                                            AppColors.brown,
                                                        onPress: () {},
                                                      ),
                                                    ],
                                                  ),
                                                  Gap(18),
                                                  Stack(
                                                    children: [
                                                      CustomTextButton(
                                                        color: AppColors
                                                            .lightPrimary,
                                                        text:
                                                            "Percentile Timer",
                                                        hasBorder: false,
                                                        textColor:
                                                            AppColors.brown,
                                                        onPress: () {},
                                                      ),
                                                      Positioned(
                                                          top: 0,
                                                          right: 0,
                                                          child:
                                                              CustomEditButton(
                                                            height: 15,
                                                            width: 15,
                                                          ))
                                                    ],
                                                  ),
                                                  Gap(22),
                                                  SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      children: [
                                                        Gap(2),
                                                        SizedBox(
                                                            width: 50,
                                                            height: 35,
                                                            child: CustomTextField(
                                                                borderColor:
                                                                    AppColors
                                                                        .lightPrimary,
                                                                borderRadius: 4,
                                                                hintFontSize:
                                                                    12,
                                                                contentSize: 12,
                                                                hintText: "05",
                                                                controller:
                                                                    processesBuilderController
                                                                        .lengthController)),
                                                        Gap(8),
                                                        CustomTextWidget(
                                                          text: "%",
                                                          textColor:
                                                              AppColors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                        Gap(8),
                                                        SizedBox(
                                                          height: 35,
                                                          width: 100,
                                                          child:
                                                              DropdownButtonFormField<
                                                                  String>(
                                                            value:
                                                                processesBuilderController
                                                                    .selectedType1
                                                                    .value,
                                                            items: [
                                                              DropdownMenuItem(
                                                                  value:
                                                                      "Type 1",
                                                                  child: CustomTextWidget(
                                                                      text:
                                                                          "Type 1 ")),
                                                              DropdownMenuItem(
                                                                  value:
                                                                      "Type 2",
                                                                  child: CustomTextWidget(
                                                                      text:
                                                                          "Type 2 ")),
                                                              DropdownMenuItem(
                                                                  value:
                                                                      "Type 3",
                                                                  child: CustomTextWidget(
                                                                      text:
                                                                          "Type 3 ")),
                                                            ],
                                                            onChanged: (value) {
                                                              processesBuilderController
                                                                  .selectedType1
                                                                  .value = value!;
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                              hintText: "CM",
                                                              hintStyle: GoogleFonts
                                                                  .montserrat(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          9),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                gapPadding: 0,
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .lightPrimary),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                gapPadding: 0,
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .lightPrimary),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                gapPadding: 0,
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .lightPrimary),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                gapPadding: 0,
                                                                borderSide: BorderSide(
                                                                    color: AppColors
                                                                        .lightPrimary),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Gap(18),
                                            Container(
                                              width: AppSizes()
                                                  .getWidthPercentage(100),
                                              padding:
                                              AppSizes().getCustomPadding(),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 0.5,
                                                    color: AppColors.brown,
                                                  ),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      12)),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  CustomTextWidget(
                                                    textAlign: TextAlign.start,
                                                    text:
                                                    "Levels with Direct Timer + Percentile Increaments",
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    textColor: AppColors.black,
                                                  ),
                                                  Gap(12),
                                                  Stack(
                                                    children: [
                                                      CustomTextButton(
                                                        color: AppColors
                                                            .lightPrimary,
                                                        text: "Thickness",
                                                        hasBorder: false,
                                                        textColor:
                                                        AppColors.brown,
                                                        onPress: () {},
                                                      ),
                                                      Positioned(
                                                          top: 0,
                                                          right: 0,
                                                          child:
                                                          CustomEditButton(
                                                            height: 15,
                                                            width: 15,
                                                          ))
                                                    ],
                                                  ),
                                                  Gap(18),
                                                  ScrollConfiguration(
                                                    behavior: ScrollBehavior().copyWith(scrollbars: false,overscroll: false),
                                                    child: SingleChildScrollView(
                                                      scrollDirection: Axis.horizontal,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          CustomFooterData(processesBuilderController: processesBuilderController,text: "Basic Level:",),
                                                          Gap(AppSizes().getWidthPercentage(2)),
                                                          CustomVerticalDivider(height: 140,color: AppColors.lightPrimary,thickness: 3,),
                                                          Gap(AppSizes().getWidthPercentage(2)),
                                                          CustomFooterData(processesBuilderController: processesBuilderController,text: "Medium Level:",),
                                                          Gap(AppSizes().getWidthPercentage(2)),
                                                          CustomVerticalDivider(height: 140,color: AppColors.lightPrimary,thickness: 3,),
                                                          Gap(AppSizes().getWidthPercentage(2)),
                                                          CustomFooterData(processesBuilderController: processesBuilderController,text: "Heavy Level:",),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                  : SizedBox.shrink(),
                            ),
                            Gap(32),
                            Obx(
                                  () => GestureDetector(
                                onTap: () {
                                  // processesBuilderController.expandedFunction();
                                },
                                child: Row(
                                  children: [
                                    CustomTextWidget(
                                      textAlign: TextAlign.start,
                                      text: "Estimator Values",
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500,
                                      textColor: AppColors.black,
                                    ),
                                    Spacer(),
                                    Icon(
                                      processesBuilderController
                                          .isExpanded.value
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomDivider(
                              color: AppColors.lightPrimary,
                              thickness: 4,
                            ),
                            Gap(18),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


