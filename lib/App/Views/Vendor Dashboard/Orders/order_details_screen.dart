import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/orders_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_images.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_text_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

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
                        text: "Order ID: 3394902445",
                        fontSize: 22,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      CustomTextButton(
                        text: "  23 : 59: 00  ",
                        fontSize: 14,
                        hasBorder: false,
                        textColor: AppColors.brown,
                        color: AppColors.white,
                        onPress: () {
                        },
                      ),
                      Gap(8),
                      CustomTextButton(
                        text: " Workflow ",
                        hasBorder: false,
                        textColor: AppColors.brown,
                        color: AppColors.lightPrimary,
                        onPress: () {
                          ordersController.selectedIndex.value = 3;
                        },
                      ),
                      Gap(8),
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
                 isLarge? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            AppColors.brown.withOpacity(0.06),
                                        blurRadius: 5,
                                        spreadRadius: 3)
                                  ]),
                              child: Padding(
                                padding: AppSizes().getCustomPadding(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                          text: "Order Item",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        CustomTextButton(
                                          color: AppColors.blue,
                                          text: "Confirmed",
                                          hasBorder: true,
                                          textColor: AppColors.blue,
                                          onPress: () {},
                                        )
                                      ],
                                    ),
                                    Gap(18),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            AppImages.cardImage,
                                            height: 105,
                                            width: 105,
                                          ),
                                          Gap(18),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CustomTextWidget(
                                                text:
                                                    "Deluxe Card | Plastic Business Card",
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                textColor: AppColors.brown,
                                              ),
                                              Gap(12),
                                              CustomTextWidget(
                                                text: "Business Card",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                textColor: AppColors.brown,
                                              ),
                                              Gap(16),
                                              SizedBox(
                                                width: AppSizes()
                                                    .getWidthPercentage(30),
                                                child: CustomTextWidget(
                                                  textAlign: TextAlign.start,
                                                  textOverflow:
                                                      TextOverflow.visible,
                                                  text:
                                                      "Get extra attention with plastic business cards. They’re waterproof and tear-resistant, with white, clear and frosted options.",
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w500,
                                                  textColor: AppColors.brown,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Gap(18),
                                    SizedBox(
                                      child: CustomTextWidget(
                                        textAlign: TextAlign.start,
                                        textOverflow: TextOverflow.visible,
                                        text:
                                            "Clear & frosted options | Height & width of a credit card | Durable, tear-resistant & waterproof | 3 material options | Choice of flexible or rigid plastic | Bright, full-color printing",
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        textColor: AppColors.brown,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Gap(18),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                        AppColors.brown.withOpacity(0.06),
                                        blurRadius: 5,
                                        spreadRadius: 3)
                                  ]),
                              child: Padding(
                                padding: AppSizes().getCustomPadding(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Order Details",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(18),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                          text: "Order Value",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.brown,
                                        ),
                                        CustomTextWidget(
                                          text: "Data Goes here",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.brown,
                                        ),
                                      ],
                                    ),
                                    Gap(18),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                          text: "Quantity",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.brown,
                                        ),
                                        CustomTextWidget(
                                          text: "2 Items",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.brown,
                                        ),
                                      ],
                                    ),
                                    Gap(18),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                          text: "Performance",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.brown,
                                        ),
                                        CustomTextWidget(
                                          text: "Data Goes here",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.brown,
                                        ),
                                      ],
                                    ),
                                    Gap(18),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomTextWidget(
                                          text: "Score",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.brown,
                                        ),
                                        CustomTextWidget(
                                          text: "'_'",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.brown,
                                        ),
                                      ],
                                    ),
                                    Gap(18),
                                   CustomDivider(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Gap(18),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            AppColors.brown.withOpacity(0.06),
                                        blurRadius: 5,
                                        spreadRadius: 3)
                                  ]),
                              child: Padding(
                                padding: AppSizes().getCustomPadding(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Supporting Document",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(12),
                                    CustomDivider(),
                                    Gap(12),
                                    SingleChildScrollView(
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.downloadIcon,
                                            color: AppColors.brown,
                                          ),
                                          Gap(8),
                                          CustomTextWidget(
                                            text: "Download the file",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            textColor: AppColors.brown,
                                          ),
                                          Spacer(),
                                          SvgPicture.asset(
                                            AppIcons.pdfIconIcon,
                                            color: AppColors.blue,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Gap(12),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            AppColors.brown.withOpacity(0.06),
                                        blurRadius: 5,
                                        spreadRadius: 3)
                                  ]),
                              child: Padding(
                                padding: AppSizes().getCustomPadding(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Storage",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    Gap(12),
                                    CustomDivider(),
                                    Gap(12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.print_outlined,
                                          color: AppColors.brown,
                                        ),
                                        Gap(4),
                                        CustomTextWidget(
                                          text: "Printing",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          textColor: AppColors.brown,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ):
                 ScrollConfiguration(
                   behavior: ScrollBehavior().copyWith(scrollbars: false,overscroll: false),
                   child: SingleChildScrollView(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           decoration: BoxDecoration(
                               color: AppColors.white,
                               borderRadius: BorderRadius.circular(14),
                               boxShadow: [
                                 BoxShadow(
                                     color:
                                     AppColors.brown.withOpacity(0.06),
                                     blurRadius: 5,
                                     spreadRadius: 3)
                               ]),
                           child: Padding(
                             padding: AppSizes().getCustomPadding(),
                             child: Column(
                               children: [
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     CustomTextWidget(
                                       text: "Order Item",
                                       fontSize: 18,
                                       fontWeight: FontWeight.w600,
                                     ),
                                     CustomTextButton(
                                       color: AppColors.blue,
                                       text: "Confirmed",
                                       hasBorder: true,
                                       textColor: AppColors.blue,
                                       onPress: () {},
                                     )
                                   ],
                                 ),
                                 Gap(18),
                                 SingleChildScrollView(
                                   scrollDirection: Axis.horizontal,
                                   child: Row(
                                     mainAxisAlignment:
                                     MainAxisAlignment.start,
                                     crossAxisAlignment:
                                     CrossAxisAlignment.start,
                                     children: [
                                       Image.asset(
                                         AppImages.cardImage,
                                         height: 105,
                                         width: 105,
                                       ),
                                       Gap(18),
                                       Column(
                                         crossAxisAlignment:
                                         CrossAxisAlignment.start,
                                         mainAxisAlignment:
                                         MainAxisAlignment.start,
                                         children: [
                                           CustomTextWidget(
                                             text:
                                             "Deluxe Card | Plastic Business Card",
                                             fontSize: 13,
                                             fontWeight: FontWeight.w500,
                                             textColor: AppColors.brown,
                                           ),
                                           Gap(12),
                                           CustomTextWidget(
                                             text: "Business Card",
                                             fontSize: 16,
                                             fontWeight: FontWeight.w600,
                                             textColor: AppColors.brown,
                                           ),
                                           Gap(16),
                                           SizedBox(
                                             width: AppSizes()
                                                 .getWidthPercentage(30),
                                             child: CustomTextWidget(
                                               textAlign: TextAlign.start,
                                               textOverflow:
                                               TextOverflow.visible,
                                               text:
                                               "Get extra attention with plastic business cards. They’re waterproof and tear-resistant, with white, clear and frosted options.",
                                               fontSize: 11,
                                               fontWeight: FontWeight.w500,
                                               textColor: AppColors.brown,
                                             ),
                                           ),
                                         ],
                                       )
                                     ],
                                   ),
                                 ),
                                 Gap(18),
                                 SizedBox(
                                   child: CustomTextWidget(
                                     textAlign: TextAlign.start,
                                     textOverflow: TextOverflow.visible,
                                     text:
                                     "Clear & frosted options | Height & width of a credit card | Durable, tear-resistant & waterproof | 3 material options | Choice of flexible or rigid plastic | Bright, full-color printing",
                                     fontSize: 11,
                                     fontWeight: FontWeight.w500,
                                     textColor: AppColors.brown,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Gap(18),
                         Container(
                           decoration: BoxDecoration(
                               color: AppColors.white,
                               borderRadius: BorderRadius.circular(14),
                               boxShadow: [
                                 BoxShadow(
                                     color:
                                     AppColors.brown.withOpacity(0.06),
                                     blurRadius: 5,
                                     spreadRadius: 3)
                               ]),
                           child: Padding(
                             padding: AppSizes().getCustomPadding(),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 CustomTextWidget(
                                   text: "Order Details",
                                   fontSize: 18,
                                   fontWeight: FontWeight.w600,
                                 ),
                                 Gap(18),
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     CustomTextWidget(
                                       text: "Order Value",
                                       fontSize: 13,
                                       fontWeight: FontWeight.w500,
                                       textColor: AppColors.brown,
                                     ),
                                     CustomTextWidget(
                                       text: "Data Goes here",
                                       fontSize: 13,
                                       fontWeight: FontWeight.w500,
                                       textColor: AppColors.brown,
                                     ),
                                   ],
                                 ),
                                 Gap(18),
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     CustomTextWidget(
                                       text: "Quantity",
                                       fontSize: 13,
                                       fontWeight: FontWeight.w500,
                                       textColor: AppColors.brown,
                                     ),
                                     CustomTextWidget(
                                       text: "2 Items",
                                       fontSize: 13,
                                       fontWeight: FontWeight.w500,
                                       textColor: AppColors.brown,
                                     ),
                                   ],
                                 ),
                                 Gap(18),
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     CustomTextWidget(
                                       text: "Performance",
                                       fontSize: 13,
                                       fontWeight: FontWeight.w500,
                                       textColor: AppColors.brown,
                                     ),
                                     CustomTextWidget(
                                       text: "Data Goes here",
                                       fontSize: 13,
                                       fontWeight: FontWeight.w500,
                                       textColor: AppColors.brown,
                                     ),
                                   ],
                                 ),
                                 Gap(18),
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     CustomTextWidget(
                                       text: "Score",
                                       fontSize: 13,
                                       fontWeight: FontWeight.w500,
                                       textColor: AppColors.brown,
                                     ),
                                     CustomTextWidget(
                                       text: "'_'",
                                       fontSize: 13,
                                       fontWeight: FontWeight.w500,
                                       textColor: AppColors.brown,
                                     ),
                                   ],
                                 ),
                                 Gap(18),
                                 CustomDivider(),
                               ],
                             ),
                           ),
                         ),
                         Gap(18),
                         Container(
                           decoration: BoxDecoration(
                               color: AppColors.white,
                               borderRadius: BorderRadius.circular(14),
                               boxShadow: [
                                 BoxShadow(
                                     color:
                                     AppColors.brown.withOpacity(0.06),
                                     blurRadius: 5,
                                     spreadRadius: 3)
                               ]),
                           child: Padding(
                             padding: AppSizes().getCustomPadding(),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 CustomTextWidget(
                                   text: "Supporting Document",
                                   fontSize: 18,
                                   fontWeight: FontWeight.w600,
                                 ),
                                 Gap(12),
                                 CustomDivider(),
                                 Gap(12),
                                 SingleChildScrollView(
                                   child: Row(
                                     children: [
                                       Icon(
                                         Icons.file_download_outlined,
                                         color: AppColors.brown,
                                       ),
                                       Gap(4),
                                       CustomTextWidget(
                                         text: "Download the file",
                                         fontSize: 12,
                                         fontWeight: FontWeight.w500,
                                         textColor: AppColors.brown,
                                       ),
                                       Spacer(),
                                       SvgPicture.asset(
                                         AppIcons.document,
                                         color: AppColors.blue,
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         Gap(12),
                         Container(
                           decoration: BoxDecoration(
                               color: AppColors.white,
                               borderRadius: BorderRadius.circular(14),
                               boxShadow: [
                                 BoxShadow(
                                     color:
                                     AppColors.brown.withOpacity(0.06),
                                     blurRadius: 5,
                                     spreadRadius: 3)
                               ]),
                           child: Padding(
                             padding: AppSizes().getCustomPadding(),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 CustomTextWidget(
                                   text: "Storage",
                                   fontSize: 18,
                                   fontWeight: FontWeight.w600,
                                 ),
                                 Gap(12),
                                 CustomDivider(),
                                 Gap(12),
                                 Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.start,
                                   children: [
                                     Icon(
                                       Icons.print_outlined,
                                       color: AppColors.brown,
                                     ),
                                     Gap(4),
                                     CustomTextWidget(
                                       text: "Printing",
                                       fontSize: 12,
                                       fontWeight: FontWeight.w500,
                                       textColor: AppColors.brown,
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         )
                       ],
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
