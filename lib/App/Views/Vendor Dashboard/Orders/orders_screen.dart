import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/orders_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_images.dart';
import '../../../Services/calender_open.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_icons.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_divider.dart';
import '../../../Widgets/custom_outline_button.dart';
import '../../../Widgets/custom_overview_container.dart';
import '../../../Widgets/custom_pagination_class.dart';
import '../../../Widgets/custom_text_button.dart';
import '../../../Widgets/custom_text_widget.dart';

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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        leftIcon: AppIcons.reportIcon,
                        hasRightIcon: false,
                        text: "Report",
                      ),
                      Gap(6),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: AppIcons.downloadIcon,
                        text: "Export",
                        onPress: () {},
                        hasRightIcon: false,
                      ),
                      Gap(6),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: AppIcons.addOutlineIcon,
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomOverViewContainer(
                                        iconPath: AppIcons.threeUsers,
                                        isLarge: isLarge,
                                        heading: "100 - ",
                                        subContainerText: "+1.5%",
                                        subContainerColor: AppColors.blue,
                                        subHeading: "Total Orders",
                                      ),
                                    ),
                                    Gap(AppSizes().getWidthPercentage(1)),
                                    Expanded(
                                      child: CustomOverViewContainer(
                                        iconPath: AppIcons.document,
                                        isLarge: isLarge,
                                        heading: "08 -",
                                        subContainerText: "+10.5%",
                                        subContainerColor: AppColors.orange,
                                        subHeading: "Avg Performance Score",
                                      ),
                                    ),
                                    Gap(AppSizes().getWidthPercentage(1)),
                                    Expanded(
                                      child: CustomOverViewContainer(
                                        isLarge: isLarge,
                                        iconPath: AppIcons.wallet,
                                        heading: "Struggled",
                                        subContainerText: "+3.9%",
                                        subContainerColor: AppColors.red,
                                        subHeading: "Avg Workflow Score",
                                      ),
                                    ),
                                  ],
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
                        icon: AppIcons.swapIcon,
                      ),
                      Gap(8),
                      CustomOutlinedButton(
                        onPressed: () {},
                        isLarge: isLarge,
                        hasJustIcon: true,
                        iconColor: AppColors.primary,
                        isCircular: true,
                        icon: AppIcons.editIcon,
                      ),
                      Gap(8),
                      CustomOutlinedButton(
                        onPressed: () {},
                        isLarge: isLarge,
                        hasJustIcon: true,
                        iconColor: AppColors.red,
                        isCircular: true,
                        icon: AppIcons.deleteIcon,
                      )
                    ],
                  ),
                  Gap(18),
                Container(
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
                          width: AppSizes().getWidthPercentage(100),
                          padding: AppSizes().getCustomPadding(top: 1, bottom: 1, right: 0, left: 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: AppColors.halfWhite2,
                          ),
                          child: Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),  // Checkbox column
                              1: FlexColumnWidth(1),   // ID
                              2: FlexColumnWidth(2),   // Product Name
                              3: FlexColumnWidth(1.5), // Order Value
                              4: FlexColumnWidth(1),   // Quantity
                              5: FlexColumnWidth(1.5), // Workflow Score
                              6: FlexColumnWidth(1),   // Stage
                              7: FlexColumnWidth(1.5), // Time Left
                              8: FlexColumnWidth(1),   // Score
                              9: FlexColumnWidth(2),   // Action
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(color: AppColors.halfWhite2),
                                children: [
                                  SizedBox(),
                                  CustomTextWidget(
                                    text: "ID",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "PRODUCT NAME",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "ORDER VALUE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "QUANTITY",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "WORKFLOW SCORE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "STAGE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "TIME LEFT",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "SCORE",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "ACTION",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Gap(12),
                        ListView.separated(
                          itemCount: ordersController.boolList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Table(
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(40),  // Checkbox column
                                1: FlexColumnWidth(1),   // ID
                                2: FlexColumnWidth(2),   // Product Name
                                3: FlexColumnWidth(1.5), // Order Value
                                4: FlexColumnWidth(1),   // Quantity
                                5: FlexColumnWidth(1.5), // Workflow Score
                                6: FlexColumnWidth(1),   // Stage
                                7: FlexColumnWidth(1.5), // Time Left
                                8: FlexColumnWidth(1),   // Score
                                9: FlexColumnWidth(2),   // Action
                              },
                              children: [
                                TableRow(
                                  decoration: BoxDecoration(color: AppColors.white),
                                  children: [
                                    Obx(() => Checkbox(
                                      value: ordersController.boolList[index].value,
                                      onChanged: (value) {
                                        ordersController.toggleCheckbox(index, value);
                                      },
                                      activeColor: AppColors.lightPrimary,
                                      checkColor: AppColors.tertiary,
                                    )),
                                    CustomTextWidget(
                                      text: "#0001",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    GestureDetector(
                                      onTap:() {
                                        ordersController.selectedIndex.value = 2;
                                      },
                                      child: SizedBox(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 13,
                                              backgroundImage: AssetImage(AppImages.profileImage),
                                            ),
                                            Gap(4),
                                            CustomTextWidget(
                                              text: "Dummy",
                                              fontWeight: FontWeight.w800,
                                              fontSize: 12,
                                              textColor: AppColors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomTextWidget(
                                      text: "Dummy",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextWidget(
                                      text: "2 Qty",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextWidget(
                                      text: "Smooth",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextWidget(
                                      text: "Printing",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextWidget(
                                      text: "3 Hrs, 20mins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextWidget(
                                      text: "_",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      textColor: AppColors.brown,
                                    ),
                                    CustomTextButton(
                                      color: AppColors.lightPrimary,
                                      hasBorder: false,
                                      textColor: AppColors.brown,
                                      text: "Workflow",
                                      onPress: () {
                                        ordersController.selectedIndex.value = 3;
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return CustomDivider();
                          },
                        ),
                        Gap(18),
                        CustomPaginationClass(),
                        Gap(18)

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
