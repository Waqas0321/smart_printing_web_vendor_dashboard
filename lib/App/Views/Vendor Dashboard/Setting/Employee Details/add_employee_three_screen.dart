import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/image_picker_services.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
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
                        leftIcon: AppIcons.downloadIcon,
                        text: "Export",
                        hasRightIcon: false,
                        onPress: () {},
                      ),
                    ],
                  ),
                  Gap(12),
                  SvgPicture.asset(AppImages.stepsLine3),
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
                                      icon: AppIcons.documentOutlineIcon,
                                      isChecked: addEmployeeController.provideEstimationCheckbox, // Make sure it's a `.value` because it's an `RxBool`
                                      onPress: (value) {
                                        // Toggle checkbox and update permission in controller
                                        addEmployeeController.toggleCheckbox(addEmployeeController.provideEstimationCheckbox, 'provideEstimation', addEmployeeController.permissions);
                                      }, // Toggle logic
                                    ),
                                  ),
                                  Gap(18),
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: AppIcons.bagIcon,
                                      title: "Create Order",
                                      isChecked: addEmployeeController.createOrderCheckbox, // Make sure it's a `.value`
                                      onPress: (value) {
                                        // Toggle checkbox and update permission in controller
                                        addEmployeeController.toggleCheckbox(addEmployeeController.createOrderCheckbox, 'createOrder', addEmployeeController.permissions);
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              Gap(18),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: AppIcons.editIcon,
                                      title: "Edit Work flow",
                                      isChecked:
                                          addEmployeeController.editWorkFlowCheckbox,
                                      onPress: (value) {
                                        addEmployeeController.toggleCheckbox(addEmployeeController.editWorkFlowCheckbox, 'editWorkFlow',addEmployeeController.permissions);
                                      },
                                    ),
                                  ),
                                  Gap(18),
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: AppIcons.threeUsers,
                                      title: "Create Employees",
                                      isChecked:
                                          addEmployeeController.createEmployeeCheckbox,
                                      onPress: (value) {
                                        addEmployeeController.toggleCheckbox(addEmployeeController.createEmployeeCheckbox, 'createEmployee',addEmployeeController.permissions);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Gap(18),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: AppIcons.swapIcon,
                                      title: "Add Processes",
                                      isChecked:
                                          addEmployeeController.addProcessesCheckbox,
                                      onPress: (value) {
                                        addEmployeeController.toggleCheckbox(addEmployeeController.addProcessesCheckbox, 'addProcesses',addEmployeeController.permissions);
                                      },
                                    ),
                                  ),
                                  Gap(12),
                                  Expanded(
                                    child: CustomPersmissionBox(
                                      icon: AppIcons.dashboardOutlineIcon,
                                      title: "Machine Operator Dashboard",
                                      isChecked:
                                          addEmployeeController.machineOperatorDashboardCheckbox,
                                      onPress: (value) {
                                        addEmployeeController.toggleCheckbox(addEmployeeController.machineOperatorDashboardCheckbox, 'machineOperatorDashboard',addEmployeeController.permissions);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(24),
                          Obx(
                            () =>  CustomTextButton(
                              color: AppColors.lightPrimary,
                              text: addEmployeeController.isLoading.value?"Loading...":"Proceed",
                              hasBorder: false,
                              textColor: AppColors.brown,
                              onPress: () {
                                addEmployeeController.addEmployee();
                              },
                            ),
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
