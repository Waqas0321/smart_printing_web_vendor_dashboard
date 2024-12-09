import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../Routes/app_routes_name.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_icons.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_circular_container.dart';
import 'custom_elevatedButton.dart';
import 'custom_text_widget.dart';

class CustomDialgueBox extends StatelessWidget {
  const CustomDialgueBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            width: AppSizes().getWidthPercentage(26),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: SvgPicture.asset(
                          AppIcons.closeSquare,
                          height: 20,
                          width: 20,
                        )),
                  ),
                  Gap(6),
                  CustomCircularContainer(
                    icon: AppIcons.tickSquare,
                    bgColor: AppColors.primary.withOpacity(0.3),
                  ),
                  Gap(12),
                  CustomTextWidget(
                    text: "Password Updated",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.black,
                  ),
                  Gap(12),
                  CustomTextWidget(
                    text:
                        "Congrats! Your password has\nbeen updated successfully.",
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    textColor: AppColors.tertiary,
                  ),
                  Gap(18),
                  CustomElevatedButton(
                    textSize: 18,
                    height: 36,
                    text: "Proceed",
                    onPress: () {
                      Get.toNamed(
                          AppRoutesName.loginScreen); // Close the dialog
                    },
                  ),
                  Gap(12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
