import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/emplyees_details_controller.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_images.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_outline_button.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_row_container.dart';

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
          child: ScrollConfiguration(
            behavior:
                ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
            child: SingleChildScrollView(
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
                        CustomRowContainer(),
                        ListView.separated(
                          itemCount: employeesDetailsController.boolList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              width: AppSizes().getWidthPercentage(100),
                              padding: AppSizes().getCustomPadding(
                                  top: 2.5, bottom: 2.5, right: 3, left: 1),
                              child: ScrollConfiguration(
                                behavior: ScrollBehavior().copyWith(
                                    overscroll: false, scrollbars: false),
                                child: SingleChildScrollView(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Checkbox(
                                          value: employeesDetailsController
                                              .boolList[index].value,
                                          onChanged: (value) {
                                            employeesDetailsController
                                                .toggleCheckbox(index, value);
                                          },
                                          activeColor: AppColors.lightPrimary,
                                          checkColor: AppColors.tertiary,
                                        ),
                                      ),
                                      CustomTextWidget(
                                        textOverflow: TextOverflow.ellipsis,
                                        text: "#01",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            AssetImage(AppImages.profileImage),
                                      ),
                                      CustomTextWidget(
                                        textOverflow: TextOverflow.ellipsis,
                                        text: "John Smith",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        textOverflow: TextOverflow.ellipsis,
                                        text: "Operator",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        textOverflow: TextOverflow.ellipsis,
                                        text: "Smooth",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                      CustomTextWidget(
                                        textOverflow: TextOverflow.ellipsis,
                                        text: "07",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
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
