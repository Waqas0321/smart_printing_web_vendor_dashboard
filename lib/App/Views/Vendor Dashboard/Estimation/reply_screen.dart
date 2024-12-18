import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Estimation/reply_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Estimation/estimation_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_text_button.dart';
import '../../../Widgets/custom_text_widget.dart';
import '../../../Widgets/process_side_widget.dart';
class ReplyScreen extends StatelessWidget {
  const ReplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EstimationController estimationController = Get.put(EstimationController());
    ReplyController replyController = Get.put(ReplyController());
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
                            estimationController.selectedIndex.value = 0;
                          },
                          child: Icon(Icons.arrow_back_ios_outlined)),
                      Gap(12),
                      CustomTextWidget(
                        text: "Reply",
                        fontSize: 22,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      CustomContainerButton(
                        isLarge: isLarge,
                        containerColor: AppColors.lightPrimary,
                        leftIcon: AppIcons.downloadIcon,
                        text: "Export",
                        hasRightIcon: false,
                        onPress: () {},
                      ),
                      Gap(8),
                      CustomTextButton(
                        text: "  Reply  ",
                        color: AppColors.lightPrimary,
                        textColor: AppColors.brown,
                        hasBorder: false,
                        onPress: () {},
                      ),
                      Gap(8),
                      CustomTextButton(
                        text: " Need more info ",
                        color: AppColors.lightPrimary,
                        textColor: AppColors.brown,
                        hasBorder: false,
                        onPress: () {},
                      ),
                    ],
                  ),
                  Gap(18),
                  Container(
                    width: AppSizes().getWidthPercentage(100),
                    padding: AppSizes().getCustomPadding(),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.brown
                                  .withOpacity(0.06),
                              blurRadius: 5,
                              spreadRadius: 3)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "Post Enquiry Details",
                          fontSize: 18,
                          textColor: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        Gap(8),
                        CustomDivider(),
                        Gap(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextWidget(
                              text: "Name",
                              fontSize: 13,
                              textColor: AppColors.brown,
                              fontWeight: FontWeight.w500,
                            ),
                            CustomTextWidget(
                              text: "Mr smith",
                              fontSize: 13,
                              textColor: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        Gap(8),
                        CustomDivider(),
                        Gap(18),
                        Container(
                          width: AppSizes().getWidthPercentage(100),
                          padding: AppSizes().getCustomPadding(),
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.7,color: AppColors.brown.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: "Details",
                                fontSize: 14,
                                textColor: AppColors.brown,
                                fontWeight: FontWeight.w500,
                              ),
                              Gap(8),
                              CustomTextWidget(
                                textAlign: TextAlign.start,
                                text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. By the readable content of a page when looking at its layout. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. By the readable content of a page when looking at its layout.",
                                fontSize: 12,
                                textColor: AppColors.brown,
                                fontWeight: FontWeight.w400,
                              ),

                            ],
                          ),
                        ),
                        Gap(18),
                        CustomDivider(),
                        Gap(8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextWidget(
                              text: "File",
                              fontSize: 13,
                              textColor: AppColors.brown,
                              fontWeight: FontWeight.w500,
                            ),
                            SvgPicture.asset(AppIcons.pdfIconIcon,color: AppColors.blue,),
                          ],
                        ),
                        Gap(8),
                        CustomDivider(),


                      ],
                    ),
                  ),
                  Gap(18),
                  Container(
                    width: AppSizes().getWidthPercentage(100),
                    padding: AppSizes().getCustomPadding(),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.brown
                                  .withOpacity(0.06),
                              blurRadius: 5,
                              spreadRadius: 3)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: "Details for sales",
                          fontSize: 18,
                          textColor: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        Gap(18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "AED. Value*",
                                      fontSize: 13,
                                      textColor: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(8),
                                    CustomTextField(
                                      hintText: "Enter Value",
                                        hintFontSize: 12,
                                        borderRadius: 6,
                                        controller: replyController.adeValueController)
                                  ],
                                ),
                              ),
                            ),
                            Gap(12),
                            Expanded(
                              child: SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Recommended Price*",
                                      fontSize: 13,
                                      textColor: AppColors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(8),
                                    CustomTextField(
                                      hintText: "Enter Price",
                                        hintFontSize: 12,
                                        borderRadius: 6,
                                        controller: replyController.recomendedPriceController)
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                        Gap(18),
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: "Lowest Price*",
                                fontSize: 13,
                                textColor: AppColors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              Gap(8),
                              CustomTextField(
                                hintText: "Enter Price",
                                  hintFontSize: 12,
                                  borderRadius: 6,
                                  controller: replyController.adeValueController)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: AppSizes().getCustomPadding(),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.brown.withOpacity(0.06),
                                    blurRadius: 5,
                                    spreadRadius: 3)
                              ]
                          ),
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
                                          mainAxisAlignment: MainAxisAlignment.center,
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
                                                    value: replyController
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
                                                      replyController
                                                          .selectedType1
                                                          .value = value!;
                                                    },
                                                    decoration:
                                                    InputDecoration(
                                                      hintText:
                                                      "Select Type",
                                                      hintStyle: TextStyle(
                                                          fontSize: 10),
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
                                                    value: replyController
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
                                                      replyController
                                                          .selectedType2
                                                          .value = value!;
                                                    },
                                                    decoration:
                                                    InputDecoration(
                                                      hintText:
                                                      "Select Type",
                                                      hintStyle: TextStyle(
                                                          fontSize: 10),
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
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              CustomTextWidget(
                                                text: "Time for",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                              Gap(4),
                                              CustomTextWidget(
                                                text: "Sheets With",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                              Gap(4),
                                              CustomTextWidget(
                                                text: "cm x",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                              Gap(4),
                                              CustomTextWidget(
                                                text: "cm =",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                            ],
                                          ),
                                        ),
                                        Gap(12),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              CustomTextWidget(
                                                text: "Minimum Time: ",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                              Gap(4),
                                              CustomTextWidget(
                                                text: ":",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                              Gap(4),
                                              CustomTextWidget(
                                                text: ":",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                              Gap(4),
                                              CustomTextWidget(
                                                text: "Buffer:",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                            ],
                                          ),
                                        ),
                                        Gap(12),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              CustomTextWidget(
                                                text: "Hold Allowed :",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                              Gap(2),
                                              CustomTextWidget(
                                                text: ":",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
                                                          .estimationIDController)),
                                              Gap(2),
                                              CustomTextWidget(
                                                text: ":",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
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
                                                      replyController
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
                      Gap(14),
                      Container(
                        padding: AppSizes().getCustomPadding(),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                          color: AppColors.brown.withOpacity(0.06),
                          blurRadius: 5,
                          spreadRadius: 3)
                            ]
                          ),
                          child: ProcessSideScreen())
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
