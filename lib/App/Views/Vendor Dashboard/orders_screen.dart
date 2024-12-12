import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/orders_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_images.dart';
import '../../Services/calender_open.dart';
import '../../Utils/Const/appColors.dart';
import '../../Utils/Const/app_icons.dart';
import '../../Utils/Const/app_sizes.dart';
import '../../Widgets/custom_container_button.dart';
import '../../Widgets/custom_divider.dart';
import '../../Widgets/custom_outline_button.dart';
import '../../Widgets/custom_overview_container.dart';
import '../../Widgets/custom_text_button.dart';
import '../../Widgets/custom_text_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersController ordersController = Get.put(OrdersController());
    final selectDateController = Get.put(OpenCalendarService());
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = AppSizes().isDesktop();
        return Padding(
          padding:
              AppSizes().getCustomPadding(top: 1, bottom: 2, left: 1, right: 1),
          child: ScrollConfiguration(
            behavior:
                ScrollBehavior().copyWith(scrollbars: false, overscroll: false),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CustomTextWidget(
                            text: "Orders",
                            fontSize: 22,
                            textColor: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          Gap(4),
                          Obx(() {
                            final date =
                                selectDateController.selectedDate.value;
                            return CustomContainerButton(
                              isLarge: isLarge,
                              text: DateFormat('yyyy-MM-dd').format(date),
                              onPress: () {
                                selectDateController
                                    .openCalendarDialog(context);
                              },
                            );
                          })
                        ],
                      ),
                      Spacer(),
                      CustomContainerButton(
                        isLarge: isLarge,
                        onPress: () {},
                        leftIcon: Icons.report_outlined,
                        hasRightIcon: false,
                        text: "Report",
                      ),
                      Gap(6),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: Icons.login_rounded,
                        text: "Export",
                        onPress: () {},
                        hasRightIcon: false,
                      ),
                      Gap(6),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: Icons.add_box_outlined,
                        onPress: () {
                          ordersController.selectedIndex.value = 1;
                        },
                        text: "Create Order",
                        hasRightIcon: false,
                        containerColor: AppColors.lightPrimary,
                      )
                    ],
                  ),
                  Gap(14),
                  isLarge
                      ? ScrollConfiguration(
                          behavior: ScrollBehavior()
                              .copyWith(scrollbars: false, overscroll: false),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ScrollConfiguration(
                                  behavior: ScrollBehavior().copyWith(
                                      scrollbars: false, overscroll: false),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        CustomOverViewContainer(
                                          iconPath: AppIcons.threeUsers,
                                          isLarge: isLarge,
                                          heading: "100 - ",
                                          subContainerText: "+1.5%",
                                          subContainerColor: AppColors.blue,
                                          subHeading: "Total Orders",
                                        ),
                                        Gap(AppSizes().getWidthPercentage(1)),
                                        CustomOverViewContainer(
                                          iconPath: AppIcons.document,
                                          isLarge: isLarge,
                                          heading: "08 -",
                                          subContainerText: "+10.5%",
                                          subContainerColor: AppColors.orange,
                                          subHeading: "Avg Performance Score",
                                        ),
                                        Gap(AppSizes().getWidthPercentage(1)),
                                        CustomOverViewContainer(
                                          isLarge: isLarge,
                                          iconPath: AppIcons.wallet,
                                          heading: "Struggled",
                                          subContainerText: "+3.9%",
                                          subContainerColor: AppColors.red,
                                          subHeading: "Avg Workflow Score",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomOverViewContainer(
                                iconPath: AppIcons.threeUsers,
                                isLarge: isLarge,
                                heading: "100 - ",
                                subContainerText: "+1.5%",
                                subContainerColor: AppColors.blue,
                                subHeading: "Total Orders",
                              ),
                              Gap(AppSizes().getHeightPercentage(1)),
                              CustomOverViewContainer(
                                iconPath: AppIcons.document,
                                isLarge: isLarge,
                                heading: "08 -",
                                subContainerText: "+10.5%",
                                subContainerColor: AppColors.orange,
                                subHeading: "Avg Performance Score",
                              ),
                              Gap(AppSizes().getHeightPercentage(1)),
                              CustomOverViewContainer(
                                isLarge: isLarge,
                                iconPath: AppIcons.wallet,
                                heading: "Struggled",
                                subContainerText: "+3.9%",
                                subContainerColor: AppColors.red,
                                subHeading: "Avg Workflow Score",
                              ),

                            ],
                          ),
                        ),
                  Gap(18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomOutlinedButton(
                        onPressed: () {},
                        isLarge: isLarge,
                        hasJustIcon: true,
                        iconColor: AppColors.primary,
                        isCircular: true,
                        icon: CupertinoIcons.down_arrow,
                      ),
                      CustomOutlinedButton(
                        onPressed: () {},
                        isLarge: isLarge,
                        hasJustIcon: true,
                        iconColor: AppColors.primary,
                        isCircular: true,
                        icon: Icons.mode_edit_outline_sharp,
                      ),
                      CustomOutlinedButton(
                        onPressed: () {},
                        isLarge: isLarge,
                        hasJustIcon: true,
                        iconColor: AppColors.red,
                        isCircular: true,
                        icon: Icons.delete_outline,
                      )
                    ],
                  ),
                  Gap(18),
                isLarge?  Container(
                    width: AppSizes().getWidthPercentage(100),
                    padding: AppSizes().getCustomPadding(
                        right: 1, left: 1, top: 1, bottom: 0),
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
                      children: [
                        Container(
                          width:
                          AppSizes().getWidthPercentage(100),
                          padding: AppSizes().getCustomPadding(
                              top: 2.5,
                              bottom: 2.5,
                              right: 0,
                              left: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(9),
                              color: AppColors.halfWhite2),
                          child: ScrollConfiguration(
                            behavior: ScrollBehavior().copyWith(
                                overscroll: false,
                                scrollbars: false),
                            child: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Gap(AppSizes()
                                      .getWidthPercentage(4)),
                                  Expanded(
                                    child: CustomTextWidget(
                                      text: "ID",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextWidget(
                                      textOverflow:
                                      TextOverflow.ellipsis,
                                      text: "PRODUCT NAME",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextWidget(
                                      textOverflow:
                                      TextOverflow.ellipsis,
                                      text: "ORDER VALUE",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextWidget(
                                      textOverflow:
                                      TextOverflow.ellipsis,
                                      text: "QUANTITY",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextWidget(
                                      textOverflow:
                                      TextOverflow.ellipsis,
                                      text: "WORKFLOW SCORE",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextWidget(
                                      textOverflow:
                                      TextOverflow.ellipsis,
                                      text: "STAGE",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextWidget(
                                      textOverflow:
                                      TextOverflow.ellipsis,
                                      text: "TIME LEFT",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextWidget(
                                      textOverflow:
                                      TextOverflow.ellipsis,
                                      text: "    SCORE",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTextWidget(
                                      textOverflow:
                                      TextOverflow.ellipsis,
                                      text: "ACTION",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ListView.separated(
                          itemCount:
                          ordersController.boolList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                ordersController.selectedIndex.value = 2;
                              },
                              child: Container(
                                width: AppSizes()
                                    .getWidthPercentage(100),
                                padding: AppSizes()
                                    .getCustomPadding(
                                    top: 2.5,
                                    bottom: 2.5,
                                    right: 1,
                                    left: 0),
                                child: ScrollConfiguration(
                                  behavior: ScrollBehavior()
                                      .copyWith(
                                      overscroll: false,
                                      scrollbars: false),
                                  child: SingleChildScrollView(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Obx(
                                              () => Checkbox(
                                            value: ordersController
                                                .boolList[index]
                                                .value,
                                            onChanged: (value) {
                                              ordersController
                                                  .toggleCheckbox(
                                                  index, value);
                                            },
                                            activeColor: AppColors
                                                .lightPrimary,
                                            checkColor:
                                            AppColors.tertiary,
                                          ),
                                        ),
                                        CustomTextWidget(
                                          textOverflow:
                                          TextOverflow.ellipsis,
                                          text: "#0001",
                                          fontWeight:
                                          FontWeight.w600,
                                          fontSize: 12,
                                          textColor:
                                          AppColors.brown,
                                        ),
                                        SizedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              CircleAvatar(
                                                radius: 13,
                                                backgroundImage:
                                                AssetImage(AppImages
                                                    .profileImage),
                                              ),
                                              Gap(4),
                                              CustomTextWidget(
                                                textOverflow:
                                                TextOverflow
                                                    .ellipsis,
                                                text: "Dummy",
                                                fontWeight:
                                                FontWeight.w800,
                                                fontSize: 12,
                                                textColor:
                                                AppColors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        CustomTextWidget(
                                          textOverflow:
                                          TextOverflow.ellipsis,
                                          text: "Dummy    ",
                                          fontWeight:
                                          FontWeight.w600,
                                          fontSize: 12,
                                          textColor:
                                          AppColors.brown,
                                        ),
                                        CustomTextWidget(
                                          textOverflow:
                                          TextOverflow.ellipsis,
                                          text: "2 Qty",
                                          fontWeight:
                                          FontWeight.w600,
                                          fontSize: 12,
                                          textColor:
                                          AppColors.brown,
                                        ),
                                        CustomTextWidget(
                                          textOverflow:
                                          TextOverflow.ellipsis,
                                          text: "Smooth",
                                          fontWeight:
                                          FontWeight.w500,
                                          fontSize: 12,
                                          textColor:
                                          AppColors.brown,
                                        ),
                                        CustomTextWidget(
                                          textOverflow:
                                          TextOverflow.ellipsis,
                                          text: "Printing",
                                          fontWeight:
                                          FontWeight.w500,
                                          fontSize: 12,
                                          textColor:
                                          AppColors.brown,
                                        ),
                                        CustomTextWidget(
                                          textOverflow:
                                          TextOverflow.ellipsis,
                                          text: "3 Hrs, 20mins",
                                          fontWeight:
                                          FontWeight.w500,
                                          fontSize: 12,
                                          textColor:
                                          AppColors.brown,
                                        ),
                                        CustomTextWidget(
                                          textOverflow:
                                          TextOverflow.ellipsis,
                                          text: "_",
                                          fontWeight:
                                          FontWeight.w500,
                                          fontSize: 12,
                                          textColor:
                                          AppColors.brown,
                                        ),
                                        CustomTextButton(
                                          color: AppColors
                                              .lightPrimary,
                                          hasBorder: false,
                                          textColor:
                                          AppColors.brown,
                                          text: "Workflow",
                                          onPress: () {
                                            ordersController.selectedIndex.value = 3;
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) {
                            return CustomDivider();
                          },
                        ),
                      ],
                    ),
                  ):Container(
                  width: AppSizes().getWidthPercentage(100),
                  padding: AppSizes().getCustomPadding(
                      right: 1, left: 1, top: 1, bottom: 0),
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
                    children: [
                      Container(
                        width:
                        AppSizes().getWidthPercentage(100),
                        padding: AppSizes().getCustomPadding(
                            top: 2.5,
                            bottom: 2.5,
                            right: 0,
                            left: 0),
                        decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(9),
                            color: AppColors.halfWhite2),
                        child: ScrollConfiguration(
                          behavior: ScrollBehavior().copyWith(
                              overscroll: false,
                              scrollbars: false),
                          child: SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Gap(AppSizes()
                                    .getWidthPercentage(4)),
                                Expanded(
                                  child: CustomTextWidget(
                                    text: "ID",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextWidget(
                                    textOverflow:
                                    TextOverflow.ellipsis,
                                    text: "PRODUCT NAME",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextWidget(
                                    textOverflow:
                                    TextOverflow.ellipsis,
                                    text: "ORDER VALUE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextWidget(
                                    textOverflow:
                                    TextOverflow.ellipsis,
                                    text: "QUANTITY",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextWidget(
                                    textOverflow:
                                    TextOverflow.ellipsis,
                                    text: "WORKFLOW SCORE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextWidget(
                                    textOverflow:
                                    TextOverflow.ellipsis,
                                    text: "STAGE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextWidget(
                                    textOverflow:
                                    TextOverflow.ellipsis,
                                    text: "TIME LEFT",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextWidget(
                                    textOverflow:
                                    TextOverflow.ellipsis,
                                    text: "    SCORE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextWidget(
                                    textOverflow:
                                    TextOverflow.ellipsis,
                                    text: "ACTION",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ListView.separated(
                        itemCount:
                        ordersController.boolList.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              ordersController.selectedIndex.value = 2;
                            },
                            child: Container(
                              width: AppSizes()
                                  .getWidthPercentage(100),
                              padding: AppSizes()
                                  .getCustomPadding(
                                  top: 2.5,
                                  bottom: 2.5,
                                  right: 1,
                                  left: 0),
                              child: ScrollConfiguration(
                                behavior: ScrollBehavior()
                                    .copyWith(
                                    overscroll: false,
                                    scrollbars: false),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Obx(
                                            () => Checkbox(
                                          value: ordersController
                                              .boolList[index]
                                              .value,
                                          onChanged: (value) {
                                            ordersController
                                                .toggleCheckbox(
                                                index, value);
                                          },
                                          activeColor: AppColors
                                              .lightPrimary,
                                          checkColor:
                                          AppColors.tertiary,
                                        ),
                                      ),
                                      CustomTextWidget(
                                        textOverflow:
                                        TextOverflow.ellipsis,
                                        text: "#0001",
                                        fontWeight:
                                        FontWeight.w600,
                                        fontSize: 12,
                                        textColor:
                                        AppColors.brown,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundImage:
                                              AssetImage(AppImages
                                                  .profileImage),
                                            ),
                                            Gap(4),
                                            CustomTextWidget(
                                              textOverflow:
                                              TextOverflow
                                                  .ellipsis,
                                              text: "Dummy",
                                              fontWeight:
                                              FontWeight.w800,
                                              fontSize: 12,
                                              textColor:
                                              AppColors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomTextWidget(
                                        textOverflow:
                                        TextOverflow.ellipsis,
                                        text: "Dummy    ",
                                        fontWeight:
                                        FontWeight.w600,
                                        fontSize: 12,
                                        textColor:
                                        AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        textOverflow:
                                        TextOverflow.ellipsis,
                                        text: "2 Qty",
                                        fontWeight:
                                        FontWeight.w600,
                                        fontSize: 12,
                                        textColor:
                                        AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        textOverflow:
                                        TextOverflow.ellipsis,
                                        text: "Smooth",
                                        fontWeight:
                                        FontWeight.w500,
                                        fontSize: 12,
                                        textColor:
                                        AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        textOverflow:
                                        TextOverflow.ellipsis,
                                        text: "Printing",
                                        fontWeight:
                                        FontWeight.w500,
                                        fontSize: 12,
                                        textColor:
                                        AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        textOverflow:
                                        TextOverflow.ellipsis,
                                        text: "3 Hrs, 20mins",
                                        fontWeight:
                                        FontWeight.w500,
                                        fontSize: 12,
                                        textColor:
                                        AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        textOverflow:
                                        TextOverflow.ellipsis,
                                        text: "_",
                                        fontWeight:
                                        FontWeight.w500,
                                        fontSize: 12,
                                        textColor:
                                        AppColors.brown,
                                      ),
                                      CustomTextButton(
                                        color: AppColors
                                            .lightPrimary,
                                        hasBorder: false,
                                        textColor:
                                        AppColors.brown,
                                        text: "Workflow",
                                        onPress: () {
                                          ordersController.selectedIndex.value = 3;
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder:
                            (BuildContext context, int index) {
                          return CustomDivider();
                        },
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
