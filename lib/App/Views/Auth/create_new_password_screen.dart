import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Auth/create_new_password_controller.dart';
import '../../Utils/Const/appColors.dart';
import '../../Utils/Const/app_icons.dart';
import '../../Utils/Const/app_images.dart';
import '../../Utils/Const/app_sizes.dart';
import '../../Widgets/custom_circular_container.dart';
import '../../Widgets/custom_dialgue_box.dart';
import '../../Widgets/custom_elevatedButton.dart';
import '../../Widgets/custom_text_widget.dart';
import '../../Widgets/custom_textfield.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CreateNewPasswordController createNewPasswordController =
        Get.put(CreateNewPasswordController());
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLarge = AppSizes().isDesktop();

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isLarge) Image(image: AssetImage(AppImages.loginBG)),
              Expanded(
                child: Container(
                  padding: AppSizes().getCustomPadding(),
                  color: AppColors.white,
                  child: ScrollConfiguration(
                    behavior: ScrollBehavior()
                        .copyWith(scrollbars: false, overscroll: false),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          isLarge
                              ? SizedBox.shrink()
                              : Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 8),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: SvgPicture.asset(AppIcons.appLogo),
                                  ),
                                ),                    isLarge
                              ? Gap(AppSizes().getHeightPercentage(2))
                              : Gap(AppSizes().getHeightPercentage(10)),
                          CustomCircularContainer(
                            icon: AppIcons.keyIcon,
                          ),
                          Gap(AppSizes().getHeightPercentage(5)),
                          CustomTextWidget(
                            text: "Create a New\nPassword",
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            textColor: AppColors.black,
                          ),
                          Gap(AppSizes().getHeightPercentage(2.5)),
                          CustomTextWidget(
                            text: "Please create your new password",
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            textColor: AppColors.tertiary,
                          ),
                          Gap(AppSizes().getHeightPercentage(6)),
                          SizedBox(
                              width: isLarge
                                  ? AppSizes().getWidthPercentage(40)
                                  : AppSizes().getWidthPercentage(90),
                              child: CustomTextField(
                                  hintText: "New Password",
                                  isSuffixIcon: true,
                                  obsecrureFun: true,
                                  controller: createNewPasswordController
                                      .createPasswordController)),
                          Gap(AppSizes().getHeightPercentage(2)),
                          SizedBox(
                              width: isLarge
                                  ? AppSizes().getWidthPercentage(40)
                                  : AppSizes().getWidthPercentage(90),
                              child: CustomTextField(
                                  hintText: "Confirm Password",
                                  isSuffixIcon: true,
                                  obsecrureFun: true,
                                  controller: createNewPasswordController
                                      .confirmPasswordController)),
                          Gap(AppSizes().getHeightPercentage(4)),
                          SizedBox(
                            width: isLarge
                                ? AppSizes().getWidthPercentage(40)
                                : AppSizes().getWidthPercentage(90),
                            child: CustomElevatedButton(
                              text: "Proceed",
                              onPress: () {
                                Get.dialog(
                                  CustomDialgueBox(),
                                  barrierDismissible: false, // Prevent closing by tapping outside
                                );
                              },
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


