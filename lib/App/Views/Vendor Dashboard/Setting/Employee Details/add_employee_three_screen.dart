import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../Controllers/Vendor Dashboard/Settings/Employee Details/add _emloyee_controller.dart';
import '../../../../Controllers/Vendor Dashboard/Settings/Employee Details/emplyees_details_controller.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_images.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Widgets/custom_container_button.dart';
import '../../../../Widgets/custom_permission_box.dart';
import '../../../../Widgets/custom_text_button.dart';
import '../../../../Widgets/custom_text_widget.dart';

class AddEmployeeThreeScreen extends StatelessWidget {
  const AddEmployeeThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeDetailsController = Get.put(EmployeesDetailsController());
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
                            addEmployeeController.selectedIndexEmployee.value--;
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
                        leftIcon: Icons.login_outlined,
                        text: "Export",
                        hasRightIcon: false,
                        onPress: () {},
                      ),
                    ],
                  ),
                  Gap(12),
                  SvgPicture.asset(AppImages.stepsOne),
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
                            text: "Permissions",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            textColor: AppColors.black,
                          ),
                          Gap(18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      title: "Provide Estimation",
                                      icon: Icons.edit_note,
                                      isChecked:
                                          addEmployeeController.isChecked,
                                      onPress: (value) => addEmployeeController
                                          .toggleCheckbox(addEmployeeController
                                              .isChecked), // Toggle logic
                                    ),
                                  ),
                                  Gap(18),
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: CupertinoIcons.lock,
                                      title: "Create Order",
                                      isChecked:
                                          addEmployeeController.isCheckedTwo,
                                      onPress: (value) => addEmployeeController
                                          .toggleCheckbox(addEmployeeController
                                              .isCheckedTwo),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(18),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: Icons.edit,
                                      title: "Edit Work flow",
                                      isChecked:
                                          addEmployeeController.isCheckedThree,
                                      onPress: (value) => addEmployeeController
                                          .toggleCheckbox(addEmployeeController
                                              .isCheckedThree),
                                    ),
                                  ),
                                  Gap(18),
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: CupertinoIcons.person_2,
                                      title: "Create Employees",
                                      isChecked:
                                          addEmployeeController.isCheckedFour,
                                      onPress: (value) => addEmployeeController
                                          .toggleCheckbox(addEmployeeController
                                              .isCheckedFour),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(18),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: CupertinoIcons.arrow_down_to_line,
                                      title: "Add Processes",
                                      isChecked:
                                          addEmployeeController.isCheckedFive,
                                      onPress: (value) => addEmployeeController
                                          .toggleCheckbox(addEmployeeController
                                              .isCheckedFive),
                                    ),
                                  ),
                                  Gap(12),
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: Icons.dashboard_rounded,
                                      title: "Machine Operator Dashboard",
                                      isChecked:
                                          addEmployeeController.isCheckedSix,
                                      onPress: (value) => addEmployeeController
                                          .toggleCheckbox(addEmployeeController
                                              .isCheckedSix),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(24),
                          CustomTextButton(
                            color: AppColors.lightPrimary,
                            text: "Proceed",
                            hasBorder: false,
                            textColor: AppColors.brown,
                            onPress: () {
                              employeeDetailsController
                                  .selectedIndexEmployee.value = 0;
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
