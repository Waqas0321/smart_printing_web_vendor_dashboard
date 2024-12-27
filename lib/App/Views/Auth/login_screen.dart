import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Auth/login_controller.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Utils/Const/app_images.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/home_screen.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
import '../../Routes/app_routes_name.dart';
import '../../Widgets/custom_checkBox.dart';
import '../../Widgets/custom_elevatedButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
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
                        key: loginController.formKey,
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
                            isLarge? Gap(AppSizes().getHeightPercentage(10)):Gap(AppSizes().getHeightPercentage(10)),
                            CustomTextWidget(
                              text: "Welcome Back!",
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                              textColor: AppColors.black,
                            ),
                            Gap(AppSizes().getHeightPercentage(2.5)),
                            CustomTextWidget(
                              text: "Please login to your account",
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
                                    hintText: "Please enter your email here",
                                    isSuffixIcon: true,
                                    icon: Icons.mail_outline_rounded,
                                    isValidateFun: true,
                                    errorText: "Please enter your email",
                                    controller: loginController.emailController)),
                            Gap(AppSizes().getHeightPercentage(2)),
                            SizedBox(
                                width: isLarge
                                    ? AppSizes().getWidthPercentage(40)
                                    : AppSizes().getWidthPercentage(90),
                                child: CustomTextField(
                                    hintText: "Password",
                                    isSuffixIcon: true,
                                    obsecrureFun: true,
                                    isValidateFun: true,
                                    errorText: "Please enter your password",
                                    controller:
                                        loginController.passwordController)),
                            Gap(AppSizes().getHeightPercentage(2)),
                            SizedBox(
                              width: isLarge
                                  ? AppSizes().getWidthPercentage(40)
                                  : AppSizes().getWidthPercentage(90),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomChexBox(
                                      text: "Remember me",
                                      loginController: loginController),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(AppRoutesName.forgetPasswordScreen);
                                    },
                                    child: CustomTextWidget(
                                      text: "Forgot Password?",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      textColor: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(AppSizes().getHeightPercentage(4)),
                            Obx(
                             () =>  SizedBox(
                                width: isLarge
                                    ? AppSizes().getWidthPercentage(40)
                                    : AppSizes().getWidthPercentage(90),
                                child: CustomElevatedButton(
                                  text:loginController.isLoading.value?"Loading...": "Login",
                                  onPress: () {
                                    if(loginController.formKey.currentState!.validate()){
                                      loginController.login();
                                    }else{
                                      ShowToast().showTopRightToast("Please enter all fields");
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
