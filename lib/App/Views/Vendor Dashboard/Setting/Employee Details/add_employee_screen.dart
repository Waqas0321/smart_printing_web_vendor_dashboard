import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Employee%20Details/add%20_emloyee_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Employee%20Details/emplyees_details_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_images.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
import '../../../../Services/image_picker_services.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Widgets/custom_container_button.dart';
import '../../../../Widgets/custom_pdf_upload_widget.dart';
import '../../../../Widgets/custom_text_widget.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

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
                            employeeDetailsController
                                .selectedIndexEmployee.value--;
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
                            text: "Employee Details",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            textColor: AppColors.black,
                          ),
                          Gap(18),
                          Obx(
                           () {
                             final imageService =
                             Get.put(ImagePickerService());
                             return Center(
                               child: Stack(
                                 children: [
                                   Container(
                                     height: 100,
                                     width: 100,
                                     decoration: BoxDecoration(
                                         color: AppColors.white,
                                         borderRadius: BorderRadius.circular(16),
                                         boxShadow: [
                                           BoxShadow(
                                               color: AppColors.brown
                                                   .withOpacity(0.06),
                                               blurRadius: 5,
                                               spreadRadius: 3)
                                         ]),
                                     child: imageService.selectedImage.value == null
                                         ?Icon(
                                       CupertinoIcons.person,
                                       size: 60,
                                       color: AppColors.brown.withOpacity(0.5),
                                     ):Image.network(
                                       imageService
                                           .selectedImage.value!.path,
                                       fit: BoxFit.cover,
                                     ),
                                   ),
                                   Positioned(
                                     bottom: 0,
                                     right: 0,
                                     child: GestureDetector(
                                       onTap: () => imageService
                                           .pickImageFromGallery(context),
                                       child: Container(
                                         decoration: BoxDecoration(
                                             color: AppColors.white,
                                             shape: BoxShape.circle,
                                             boxShadow: [
                                               BoxShadow(
                                                   color: AppColors.brown
                                                       .withOpacity(0.06),
                                                   blurRadius: 5,
                                                   spreadRadius: 3)
                                             ]),
                                         child: IconButton(
                                           icon: const Icon(Icons.camera_alt,
                                               size: 20, color: AppColors.primary),
                                           onPressed: () {
                                             // Camera action here
                                           },
                                         ),
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                             );
                           }
                          ),
                          Gap(24),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Name*",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      textColor: AppColors.black,
                                    ),
                                    Gap(4),
                                    CustomTextField(
                                        borderRadius: 6,
                                        hintText: "Position",
                                        hintFontSize: 12,
                                        contentSize: 14,
                                        controller: addEmployeeController
                                            .nameController)
                                  ],
                                ),
                              ),
                              Gap(12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Position*",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      textColor: AppColors.black,
                                    ),
                                    Gap(4),
                                    CustomTextField(
                                        borderRadius: 6,
                                        hintText: "Position",
                                        hintFontSize: 12,
                                        contentSize: 14,
                                        controller: addEmployeeController
                                            .nameController)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Gap(24),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Address",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      textColor: AppColors.black,
                                    ),
                                    Gap(4),
                                    CustomTextField(
                                        borderRadius: 6,
                                        hintText: "Address",
                                        hintFontSize: 12,
                                        contentSize: 14,
                                        controller: addEmployeeController
                                            .nameController)
                                  ],
                                ),
                              ),
                              Gap(12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      text: "Phone Number*",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      textColor: AppColors.black,
                                    ),
                                    Gap(4),
                                    CustomTextField(
                                        borderRadius: 6,
                                        hintText: "Phone Number",
                                        hintFontSize: 12,
                                        contentSize: 14,
                                        controller: addEmployeeController
                                            .nameController)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Gap(24),
                          CustomPDFUploadWidget(
                            onPress: () {
                              addEmployeeController.pickPDF();
                            },
                            onPressRemove: (int index) {  // Pass the dynamic index
                              addEmployeeController.removePDF(index);
                            },
                            selectedFiles: addEmployeeController.selectedFiles,
                          ),
                          Gap(24),
                          CustomTextButton(
                            color: AppColors.lightPrimary,
                            text: "Proceed",
                            hasBorder: false,
                            textColor: AppColors.brown,
                            onPress: () {
                              addEmployeeController.selectedIndexEmployee.value = 1;
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
