import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/processes_controller.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Widgets/custom_divider.dart';
import '../../../Utils/Const/appColors.dart';
import '../../../Utils/Const/app_sizes.dart';
import '../../../Widgets/custom_container_button.dart';
import '../../../Widgets/custom_outline_button.dart';
import '../../../Widgets/custom_text_widget.dart';

class ProcessesScreen extends StatelessWidget {
  const ProcessesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProcessesController processesController = Get.put(ProcessesController());
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
                        text: "Processes Details",
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
                        text: "Process",
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
                        Container(
                        width: AppSizes().getWidthPercentage(100),
                    padding: AppSizes().getCustomPadding(
                        top: 2.5, bottom: 2.5, right: 1, left: 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: AppColors.halfWhite2),
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior()
                          .copyWith(overscroll: false, scrollbars: false),
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Gap(AppSizes().getWidthPercentage(11.5)),
                            Expanded(
                              child: CustomTextWidget(
                                text: "ID",
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                textColor: AppColors.brown,
                              ),
                            ),
                            Expanded(
                              child: CustomTextWidget(
                                textOverflow: TextOverflow.ellipsis,
                                text: "PROCESS NAME",
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                textColor: AppColors.brown,
                              ),
                            ),
                            Expanded(
                              child: CustomTextWidget(
                                textOverflow: TextOverflow.ellipsis,
                                text: "NO OF MACHINES",
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                textColor: AppColors.brown,
                              ),
                            ),
                            Expanded(
                              child: CustomTextWidget(
                                textOverflow: TextOverflow.ellipsis,
                                text: "WORKFLOW SCORE",
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                textColor: AppColors.brown,
                              ),
                            ),
                            Expanded(
                              child: CustomTextWidget(
                                textOverflow: TextOverflow.ellipsis,
                                text: "PERFORMANCE SCORE",
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                textColor: AppColors.brown,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                        ListView.separated(
                          itemCount: processesController.boolList.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              width: AppSizes().getWidthPercentage(100),
                              padding: AppSizes().getCustomPadding(
                                  top: 2.5, bottom: 2.5, right: 5, left: 1),
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
                                          value: processesController
                                              .boolList[index].value,
                                          onChanged: (value) {
                                            processesController.toggleCheckbox(index, value);
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
                                      CustomTextWidget(
                                        textOverflow: TextOverflow.ellipsis,
                                        text: "Dummy name",
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
                                        text: "08",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        textColor: AppColors.brown,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }, separatorBuilder: (BuildContext context, int index) { return CustomDivider(); },
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
