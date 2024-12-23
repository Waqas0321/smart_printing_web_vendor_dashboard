import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Processes/process_builder_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/Processes/processes_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_button.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Widgets/custom_container_button.dart';
import '../../../../Widgets/custom_edit_button.dart';
import '../../../../Widgets/custom_text_widget.dart';

class ProcessBuilderScreen extends StatelessWidget {
  const ProcessBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final processesController = Get.put(ProcessesController());
    final processesBuilderController = Get.put(ProcessBuilderController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isLarge = AppSizes().isDesktop();
        return SizedBox(
          height: AppSizes().getHeightPercentage(90),
          child: Stack(
            children: [
              Padding(
                padding: AppSizes()
                    .getCustomPadding(top: 1, bottom: 2, left: 1, right: 1),
                child: ScrollConfiguration(
                  behavior: ScrollBehavior()
                      .copyWith(overscroll: false, scrollbars: false),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  processesController
                                      .selectedIndexProcesses.value = 0;
                                },
                                child: Icon(Icons.arrow_back_ios_outlined)),
                            Gap(12),
                            CustomTextWidget(
                              text: "Process Builder",
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
                            Gap(6),
                            CustomTextButton(
                              color: AppColors.lightPrimary,
                              hasBorder: false,
                              textColor: AppColors.brown,
                              text: "  Process  ",
                              onPress: () {
                                processesController
                                    .selectedIndexProcesses.value = 0;
                              },
                            ),
                          ],
                        ),
                        Gap(18),
                        Container(
                          padding: AppSizes().getCustomPadding(),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.brown.withOpacity(0.06),
                                    blurRadius: 5,
                                    spreadRadius: 3)
                              ]),
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              scrollbars: false,
                              overscroll: false,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomTextWidget(
                                        text: "Process Name:",
                                        fontSize: 22,
                                        textColor: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Gap(12),
                                      CustomTextWidget(
                                        text: "Lamination",
                                        fontSize: 22,
                                        textColor: AppColors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Gap(2),
                                      CustomEditButton(
                                        height: 16,
                                        width: 16,
                                      )
                                    ],
                                  ),
                                  Gap(12),
                                  CustomDivider(
                                    color: AppColors.lightPrimary,
                                    thickness: 4,
                                  ),
                                  
                                  Gap(22),
                                  CustomTextWidget(
                                    text: "Estimator Form",
                                    fontSize: 18,
                                    textColor: AppColors.brown.withOpacity(0.4),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Gap(12),
                                  DottedBorder(
                                    color: AppColors.brown,
                                    dashPattern: [12, 6],
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(12),
                                    // For dotted border
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(34),
                                        // Ensures internal child respects the same radius
                                        child: GestureDetector(
                                          onTap: () {
                                            processesBuilderController
                                                .openFieldGeneratorScreen(
                                                    context);
                                          },
                                          child: SizedBox(
                                            height: 250,
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.add_circle_sharp,
                                                      color: AppColors.black),
                                                  Gap(18),
                                                  CustomTextWidget(
                                                    text: "Add Fields",
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: AppSizes().getWidthPercentage(100),
                  color: AppColors.lightPrimary,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  height: 36,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        text: "Estimated Completion Time :",
                        fontSize: 16,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(12),
                      CustomTextWidget(
                        text: "00 : 00 : 00",
                        fontSize: 16,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}


