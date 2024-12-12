import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/orders_controller.dart';
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
                      CustomContainerButton(
                        isLarge: isLarge,
                        containerColor: AppColors.white,
                        textColor: AppColors.brown,
                        leftIcon: Icons.watch_later_outlined,
                        text: "23 : 59: 00",
                        hasRightIcon: false,
                        onPress: () {},
                      ),
                      Gap(8),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: Icons.flash_on_sharp,
                        text: "Workflow",
                        containerColor: AppColors.lightPrimary,
                        hasRightIcon: false,
                        onPress: () {
                          ordersController.selectedIndex.value = 3;
                        },
                      ),
                      Gap(8),
                      CustomContainerButton(
                        isLarge: isLarge,
                        leftIcon: Icons.arrow_back_ios_outlined,
                        text: "Back",
                        textColor: AppColors.brown,
                        hasRightIcon: false,
                        onPress: () {
                          ordersController.selectedIndex.value = 0;
                        },
                      ),
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
