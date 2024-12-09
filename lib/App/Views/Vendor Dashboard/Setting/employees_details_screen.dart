import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/emplyees_details_controller.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_outline_button.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';

import '../../../Utils/Const/appColors.dart';
import '../../../Widgets/custom_container_button.dart';

class EmployeesDetailsScreen extends StatelessWidget {
  const EmployeesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EmployeesDetailsController employeesDetailsController =
        Get.put(EmployeesDetailsController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = AppSizes().isDesktop();
        return Padding(
          padding:
              AppSizes().getCustomPadding(top: 1, bottom: 2, left: 1, right: 1),
          child: Column(
            children: [
              Row(
                children: [
                  CustomTextWidget(
                    text: "Employee Details",
                    fontSize: 22,
                    textColor: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  Spacer(),
                  CustomContainerButton(
                    isLarge: isLarge,
                    leftIcon: Icons.login_outlined,
                    text: "Export",
                    hasRightIcon: false,
                    onPress: () {},
                  ),
                  Gap(8),
                  CustomContainerButton(
                    leftIcon: Icons.add_box_outlined,
                    containerColor: AppColors.lightPrimary,
                    isLarge: isLarge,
                    hasRightIcon: false,
                    text: "Add Employee",
                    onPress: () {},
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
              )
            ],
          ),
        );
      },
    );
  }
}
