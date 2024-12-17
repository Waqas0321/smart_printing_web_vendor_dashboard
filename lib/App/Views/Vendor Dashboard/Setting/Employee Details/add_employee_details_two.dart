import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import '../../../../Controllers/Vendor Dashboard/Settings/Employee Details/add _emloyee_controller.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_images.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Widgets/custom_container_button.dart';
import '../../../../Widgets/custom_text_widget.dart';
import '../../../../Widgets/custom_textfield.dart';

class AddEmployeeDetailsTwo extends StatelessWidget {
  const AddEmployeeDetailsTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final addEmployeeController = Get.put(AddEmployeeController());
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
                            addEmployeeController.selectedIndexEmployee.value =
                                0;
                          },
                          child: Icon(Icons.arrow_back_ios_outlined)),
                      Gap(12),
                      CustomTextWidget(
                        text: "Add Employee",
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
                    ],
                  ),
                  Gap(12),
                  SvgPicture.asset(AppImages.stepsLine2),
                  Gap(32),
                  Container(
                    width: AppSizes().getWidthPercentage(100),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.brown.withOpacity(0.06),
                              blurRadius: 5,
                              spreadRadius: 3)
                        ]),
                    child: Padding(
                      padding: AppSizes().getCustomPadding(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: "Login Details",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            textColor: AppColors.black,
                          ),
                          Gap(18),
                          CustomTextWidget(
                            text: "User ID*",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.black,
                          ),
                          Gap(4),
                          CustomTextField(
                              borderRadius: 6,
                              hintText: "ID",
                              hintFontSize: 12,
                              contentSize: 14,
                              controller: addEmployeeController.nameController),
                          Gap(18),
                          CustomTextWidget(
                            text: "Password*",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.black,
                          ),
                          Gap(4),
                          CustomTextField(
                              borderRadius: 6,
                              hintText: "Password",
                              hintFontSize: 12,
                              contentSize: 14,
                              controller: addEmployeeController.nameController),
                          Gap(24),
                          CustomTextButton(
                            color: AppColors.lightPrimary,
                            text: "Proceed",
                            hasBorder: false,
                            textColor: AppColors.brown,
                            onPress: () {
                              addEmployeeController
                                  .selectedIndexEmployee.value = 2;
                            },
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
