import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/orders_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_pdf_upload_widget.dart';
import '../../../Widgets/custom_text_widget.dart';
import '../../../Widgets/process_side_widget.dart';

class CreateOrderScreen extends StatelessWidget {
  const CreateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersController = Get.put(OrdersController());
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
                      CustomTextWidget(
                        text: "Create a New Order",
                        fontSize: 22,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: AppIcons.backIcon,
                        text: "Back",
                        textColor: AppColors.brown,
                        hasRightIcon: false,
                        onPress: () {
                          ordersController.selectedIndex.value = 0;
                        },
                      ),
                    ],
                  ),
                  Gap(18),
                  CustomPDFUploadWidget(
                    onPress: () {
                      ordersController.pickPDF();
                    },
                    onPressRemove: (int index) {  // Pass the dynamic index
                      ordersController.removePDF(index);
                    },
                    selectedFiles: ordersController.selectedFiles,
                  ),

                  Gap(28),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "Estimation ID*",
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.brown,
                        ),
                        Gap(4),
                        CustomTextField(
                            borderRadius: 8,
                            hintFontSize: 12,
                            hintText: "Enter ID",
                            borderColor: AppColors.brown.withOpacity(0.5),
                            controller:
                                ordersController.estimationIDController),
                        Gap(12),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    text: "Product/Services*",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColors.brown,
                                  ),
                                  Gap(4),
                                  CustomTextField(
                                      borderRadius: 8,
                                      hintFontSize: 12,
                                      hintText: "Select Product Type",
                                      borderColor:
                                          AppColors.brown.withOpacity(0.5),
                                      controller: ordersController
                                          .estimationIDController)
                                ],
                              ),
                            ),
                            Gap(8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    text: "Customer Paid Value*",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColors.brown,
                                  ),
                                  Gap(4),
                                  CustomTextField(
                                      borderRadius: 8,
                                      hintFontSize: 12,
                                      hintText: "Enter Value",
                                      borderColor:
                                          AppColors.brown.withOpacity(0.5),
                                      controller: ordersController
                                          .estimationIDController)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gap(18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Production Process",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      textColor: AppColors.brown,
                                    ),
                                    Gap(18),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            child: Column(
                                              children: [
                                                Container(
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .lightPrimary),
                                                    child: Center(
                                                        child: CustomTextWidget(
                                                      text: "1",
                                                      fontSize: 12,
                                                    ))),
                                                CustomVerticalDivider(
                                                  height: 250,
                                                  color: AppColors.lightPrimary,
                                                  thickness: 3,
                                                ),
                                                Container(
                                                    padding: EdgeInsets.all(3),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors.white,
                                                        border: Border.all(
                                                            width: 0.6,
                                                            color: AppColors
                                                                .lightPrimary)),
                                                    child: Center(
                                                        child: CustomTextWidget(
                                                      text: "+",
                                                      fontSize: 12,
                                                    ))),
                                              ],
                                            ),
                                          ),
                                          Gap(8),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomTextWidget(
                                                text: "Lamination",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
                                              ),
                                              Gap(12),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 200,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomTextWidget(
                                                          text: "Type*",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              AppColors.brown,
                                                        ),
                                                        Gap(5),
                                                        DropdownButtonFormField<
                                                            String>(
                                                          value:
                                                              ordersController
                                                                  .selectedType1
                                                                  .value,
                                                          items: [
                                                            DropdownMenuItem(
                                                                value: "Type 1",
                                                                child: Text(
                                                                    "Type 1")),
                                                            DropdownMenuItem(
                                                                value: "Type 2",
                                                                child: Text(
                                                                    "Type 2")),
                                                            DropdownMenuItem(
                                                                value: "Type 3",
                                                                child: Text(
                                                                    "Type 3")),
                                                          ],
                                                          onChanged: (value) {
                                                            ordersController
                                                                .selectedType1
                                                                .value = value!;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Select Type",
                                                            hintStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        10),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Gap(4),
                                                  SizedBox(
                                                    width: 200,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomTextWidget(
                                                          text: "Sides*",
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textColor:
                                                              AppColors.brown,
                                                        ),
                                                        Gap(5),
                                                        DropdownButtonFormField<
                                                            String>(
                                                          value:
                                                              ordersController
                                                                  .selectedType2
                                                                  .value,
                                                          items: [
                                                            DropdownMenuItem(
                                                                value: "Type 1",
                                                                child: Text(
                                                                    "Type 1")),
                                                            DropdownMenuItem(
                                                                value: "Type 2",
                                                                child: Text(
                                                                    "Type 2")),
                                                            DropdownMenuItem(
                                                                value: "Type 3",
                                                                child: Text(
                                                                    "Type 3")),
                                                          ],
                                                          onChanged: (value) {
                                                            ordersController
                                                                .selectedType2
                                                                .value = value!;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                "Select Type",
                                                            hintStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        10),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Gap(12),
                                              CustomTextWidget(
                                                text: "Time calculation:",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
                                              ),
                                              Gap(12),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    CustomTextWidget(
                                                      text: "Time for",
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
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
                                                    Gap(4),
                                                    CustomTextWidget(
                                                      text: "Sheets With",
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
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
                                                    Gap(4),
                                                    CustomTextWidget(
                                                      text: "cm x",
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
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
                                                    Gap(4),
                                                    CustomTextWidget(
                                                      text: "cm =",
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
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
                                                  ],
                                                ),
                                              ),
                                              Gap(12),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    CustomTextWidget(
                                                      text: "Minimum Time: ",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      textColor:
                                                          AppColors.brown,
                                                    ),
                                                    Gap(2),
                                                    SizedBox(
                                                        width: 60,
                                                        height: 35,
                                                        child: CustomTextField(
                                                            contentSize: 12,
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "00",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
                                                    Gap(4),
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
                                                        width: 60,
                                                        height: 35,
                                                        child: CustomTextField(
                                                            contentSize: 12,
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "05",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
                                                    Gap(4),
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
                                                        width: 60,
                                                        height: 35,
                                                        child: CustomTextField(
                                                            contentSize: 12,
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "00",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
                                                    Gap(4),
                                                    CustomTextWidget(
                                                      text: "Buffer:",
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
                                                            contentSize: 12,
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "20%",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
                                                  ],
                                                ),
                                              ),
                                              Gap(12),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    CustomTextWidget(
                                                      text: "Hold Allowed :",
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      textColor:
                                                          AppColors.brown,
                                                    ),
                                                    Gap(2),
                                                    SizedBox(
                                                        width: 60,
                                                        height: 35,
                                                        child: CustomTextField(
                                                            contentSize: 12,
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "00",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
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
                                                        width: 60,
                                                        height: 35,
                                                        child: CustomTextField(
                                                            contentSize: 12,
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "05",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
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
                                                        width: 60,
                                                        height: 35,
                                                        child: CustomTextField(
                                                            contentSize: 12,
                                                            borderColor: AppColors
                                                                .lightPrimary,
                                                            borderRadius: 4,
                                                            hintFontSize: 8,
                                                            hintText: "00",
                                                            controller:
                                                                ordersController
                                                                    .estimationIDController)),
                                                  ],
                                                ),
                                              ),
                                              Gap(12),
                                              CustomTextWidget(
                                                text: "Add More",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Gap(8)
                                  ],
                                ),
                              ),
                            ),
                            Gap(12),
                            ProcessSideScreen()
                          ],
                        ),
                        Gap(18),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    text: "Delivery Requirement*",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColors.brown,
                                  ),
                                  Gap(4),
                                  DropdownButtonFormField<String>(
                                    value: ordersController.selectedType1.value,
                                    items: [
                                      DropdownMenuItem(
                                          value: "Type 1",
                                          child: Text("Type 1")),
                                      DropdownMenuItem(
                                          value: "Type 2",
                                          child: Text("Type 2")),
                                      DropdownMenuItem(
                                          value: "Type 3",
                                          child: Text("Type 3")),
                                    ],
                                    onChanged: (value) {
                                      ordersController.selectedType1.value =
                                          value!;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Select Type",
                                      hintStyle: TextStyle(fontSize: 10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    text: "Delivery Address*",
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    textColor: AppColors.brown,
                                  ),
                                  Gap(4),
                                  CustomTextField(
                                      borderRadius: 8,
                                      hintFontSize: 12,
                                      hintText: "Write your location...",
                                      isSuffixIcon: true,
                                      icon: Icons.location_on_outlined,
                                      borderColor:
                                          AppColors.brown.withOpacity(0.5),
                                      controller: ordersController
                                          .estimationIDController)
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gap(18),
                        CustomTextWidget(
                          text: "Order Description*",
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.brown,
                        ),
                        Gap(4),
                        CustomTextField(
                            borderRadius: 8,
                            maxLines: 4,
                            hintFontSize: 12,
                            hintText: "Write text here...",
                            borderColor: AppColors.brown.withOpacity(0.5),
                            controller:
                                ordersController.estimationIDController),
                        Gap(28),
                        Row(children: [
                          CustomTextButton(
                            color: AppColors.lightPrimary,
                            text: "Create Order",
                            hasBorder: false,
                            textColor: AppColors.brown,
                            onPress: () {},
                          ),
                          Gap(12),
                          CustomTextButton(
                            color: AppColors.red,
                            text: "cancel",
                            hasBorder: false,
                            textColor: AppColors.white,
                            onPress: () {},
                          )
                        ])
                      ],
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
