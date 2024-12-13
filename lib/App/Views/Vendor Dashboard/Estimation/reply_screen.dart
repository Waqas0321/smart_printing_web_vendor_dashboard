import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Estimation/reply_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/estimation_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_text_widget.dart';
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
                        leftIcon: Icons.login_outlined,
                        text: "Export",
                        hasRightIcon: false,
                        onPress: () {},
                      ),
                      Gap(8),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: Icons.replay,
                        text: "Reply",
                        hasRightIcon: false,
                        onPress: () {},
                      ),
                      Gap(8),
                      CustomContainerButton(
                        isLarge: isLarge,
                        containerColor: AppColors.orange,
                        leftIcon: Icons.add_box_outlined,
                        text: "Need more info",
                        textColor: AppColors.white,
                        hasRightIcon: false,
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
                            SvgPicture.asset(AppIcons.document,color: AppColors.blue,),
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
