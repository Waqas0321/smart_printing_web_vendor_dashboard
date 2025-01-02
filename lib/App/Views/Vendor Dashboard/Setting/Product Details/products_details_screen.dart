import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Product_Details/product_details_controller.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/settings_controller.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_icons.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Widgets/custom_container_button.dart';
import '../../../../Widgets/custom_outline_button.dart';
import '../../../../Widgets/custom_pagination_class.dart';
import '../../../../Widgets/custom_text_button.dart';
import '../../../../Widgets/custom_text_widget.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsController productDetailsController =
        Get.put(ProductDetailsController());
    final settingController = Get.put(SettingsController());
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
                            settingController.selectedIndex.value = 0;

                          },
                          child: Icon(Icons.arrow_back_ios_outlined)),
                      Gap(12),
                      CustomTextWidget(
                        text: "Product Details",
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
                      Gap(8),
                      CustomContainerButton(
                        leftIcon: AppIcons.addOutlineIcon,
                        containerColor: AppColors.lightPrimary,
                        isLarge: isLarge,
                        hasRightIcon: false,
                        text: "Add Product",
                        onPress: () {
                          productDetailsController.selectedIndexProducts.value = 1;
                        },
                      )
                    ],
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
                    padding: AppSizes()
                        .getCustomPadding(right: 1, left: 1, top: 1, bottom: 0),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.brown.withOpacity(0.06),
                              blurRadius: 5,
                              spreadRadius: 3)
                        ]),
                    child: Column(
                      children: [
                        Container(
                          width: AppSizes().getWidthPercentage(100),
                          padding: AppSizes().getCustomPadding(top: 2, bottom: 2, right: 1, left: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: AppColors.halfWhite2,
                          ),
                          child: Table(
                            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(40),  // Checkbox
                              1: FlexColumnWidth(1.5), // Product ID
                              2: FixedColumnWidth(60), // Product Image
                              3: FlexColumnWidth(2),   // Product Name
                              4: FlexColumnWidth(1.5), // Category
                            },
                            children: [
                              TableRow(
                                decoration: BoxDecoration(color: AppColors.halfWhite2),
                                children: [
                                  SizedBox(), // Empty space for the checkbox header
                                  CustomTextWidget(
                                    text: "PRODUCT ID",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    textColor: AppColors.brown,
                                  ),
                                  CustomTextWidget(
                                    text: "PRODUCT IMAGE",
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
                                    text: "CATEGORY",
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
                        FutureBuilder(
                          future: productDetailsController.fetchProducts(),
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return ListView.separated(
                                itemCount: 8,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Table(
                                    defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                    columnWidths: const <int,
                                        TableColumnWidth>{
                                      0: FixedColumnWidth(40),  // Checkbox
                                      1: FlexColumnWidth(1.5), // Product ID
                                      2: FixedColumnWidth(60), // Product Image
                                      3: FlexColumnWidth(2),   // Product Name
                                      4: FlexColumnWidth(1.5),
                                    },
                                    children: [
                                      TableRow(
                                        decoration: BoxDecoration(
                                            color: AppColors.white),
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 25,
                                            color: Colors.grey.shade300,
                                          ),
                                          Container(
                                            height: 15,
                                            color: Colors.grey.shade300,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                          ),
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                            Colors.grey.shade300,
                                          ),
                                          Container(
                                            height: 15,
                                            color: Colors.grey.shade300,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                          ),
                                          Container(
                                            height: 15,
                                            color: Colors.grey.shade300,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 5),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return CustomDivider();
                                },
                              );
                            }else if(snapshot.hasError){
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error,
                                        color: AppColors.red, size: 40),
                                    Gap(10),
                                    CustomTextWidget(
                                      text: "Something went wrong!",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      textColor: AppColors.red,
                                    ),
                                    Gap(10),
                                    CustomTextButton(
                                      color: AppColors.lightPrimary,
                                      text: " Retry ",
                                      hasBorder: false,
                                      textColor: AppColors.white,
                                      onPress: () {
                                        productDetailsController
                                            .fetchProducts();
                                      },
                                    )
                                  ],
                                ),
                              );
                            }else if (snapshot.hasData ||
                                snapshot.data!.isNotEmpty){
                              final products = snapshot.data;
                              return ListView.separated(
                                itemCount: products!.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Table(
                                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                    columnWidths: const <int, TableColumnWidth>{
                                      0: FixedColumnWidth(40),  // Checkbox
                                      1: FlexColumnWidth(1.5), // Product ID
                                      2: FixedColumnWidth(60), // Product Image
                                      3: FlexColumnWidth(2),   // Product Name
                                      4: FlexColumnWidth(1.5), // Category
                                    },
                                    children: [
                                      TableRow(
                                        decoration: BoxDecoration(color: AppColors.white),
                                        children: [
                                          Obx(() => Checkbox(
                                            value: productDetailsController.boolList[index].value,
                                            onChanged: (value) {
                                              productDetailsController.toggleCheckbox(index, value);
                                            },
                                            activeColor: AppColors.lightPrimary,
                                            checkColor: AppColors.tertiary,
                                          )),
                                          CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: "#${products[index].id}",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundImage: NetworkImage(products[index].img),
                                          ),
                                          CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: products[index].name,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                          CustomTextWidget(
                                            textOverflow: TextOverflow.ellipsis,
                                            text: products[index].categories.first,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            textColor: AppColors.brown,
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return CustomDivider();
                                },
                              );
                            }else{
                              return Center(
                                child: CustomTextWidget(
                                  text: "No data available.",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  textColor: AppColors.red,
                                ),
                              );
                            }
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
