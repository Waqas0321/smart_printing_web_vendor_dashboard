import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Routes/app_routes_name.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_images.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Views/Auth/create_new_password_screen.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
import '../../Controllers/Auth/forget_password_controller.dart';
import '../../Services/show_toast.dart';
import '../../Widgets/custom_circular_container.dart';
import '../../Widgets/custom_elevatedButton.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController forgetPasswordController =
        Get.put(ForgetPasswordController());
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
                      child: Form(
                        key: forgetPasswordController.formKey,
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
                                  ),
                            isLarge
                                ? Gap(AppSizes().getHeightPercentage(15))
                                : Gap(AppSizes().getHeightPercentage(10)),
                            CustomCircularContainer(
                              icon: AppIcons.keyIcon,
                            ),
                            Gap(AppSizes().getHeightPercentage(10)),
                            CustomTextWidget(
                              text: "Email Verification",
                              fontSize: 48,
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.black,
                            ),
                            Gap(AppSizes().getHeightPercentage(1.5)),
                            CustomTextWidget(
                              text: "Please enter your email address. You’ll receive\nlink to create a new password.",
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              textColor: AppColors.tertiary,
                            ),
                            Gap(AppSizes().getHeightPercentage(5)),
                            SizedBox(
                                width: isLarge
                                    ? AppSizes().getWidthPercentage(40)
                                    : AppSizes().getWidthPercentage(90),
                                child: CustomTextField(
                                    hintText: "Please enter your email here",
                                    isSuffixIcon: true,
                                    isValidateFun: true,
                                    errorText: "Please enter your email",
                                    icon: Icons.mail_outline_rounded,
                                    controller: forgetPasswordController
                                        .emailController)),
                            Gap(AppSizes().getHeightPercentage(2)),
                            Gap(32),
                            Obx(
                              () =>  SizedBox(
                                width: isLarge
                                    ? MediaQuery.of(context).size.width * 0.4
                                    : MediaQuery.of(context).size.width * 0.9,
                                child: CustomElevatedButton(
                                  text: forgetPasswordController.isLoading.value?"Loading...":"Proceed",
                                  onPress: () {
                                    if(forgetPasswordController.formKey.currentState!.validate()){
                                      forgetPasswordController.forgetPassword();
                                    }else{
                                      ShowToast().showTopToast("Please enter your email");
                                      Get.to(CreateNewPasswordScreen());
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
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
