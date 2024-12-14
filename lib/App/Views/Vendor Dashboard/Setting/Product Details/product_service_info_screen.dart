import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Product_Details/product_service_info_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';

class ProductServiceInfoScreen extends StatelessWidget {
  const ProductServiceInfoScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductServiceInfoController productServiceInfoController =
        Get.put(ProductServiceInfoController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLarge = AppSizes().isDesktop();
        return Material(
          color: Colors.white,
          elevation: 8,
          child: Padding(
            padding: AppSizes().getCustomPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextWidget(
                  text: "Product Services Information",
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                Gap(8),
                CustomDivider(),
                Gap(8),
                GestureDetector(
                  onTap: () {
                    productServiceInfoController
                        .openProductServiceInfoTwo(context);
                  },
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: AppSizes().getCustomPadding(),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightPrimary,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.card_giftcard,
                              color: AppColors.brown,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              textAlign: TextAlign.start,
                              text: "Non-Inventory",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              textColor: AppColors.black,
                            ),
                            SizedBox(
                              width: 240,
                              child: CustomTextWidget(
                                textAlign: TextAlign.start,
                                textOverflow: TextOverflow.visible,
                                text:
                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                textColor: AppColors.brown,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Gap(8),
                CustomDivider(),
                Gap(8),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: AppSizes().getCustomPadding(),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.lightPrimary,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.print,
                              color: AppColors.brown,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              textAlign: TextAlign.start,
                              text: "Service",
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              textColor: AppColors.black,
                            ),
                            SizedBox(
                              width: 240,
                              child: CustomTextWidget(
                                textAlign: TextAlign.start,
                                textOverflow: TextOverflow.visible,
                                text:
                                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                textColor: AppColors.brown,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
