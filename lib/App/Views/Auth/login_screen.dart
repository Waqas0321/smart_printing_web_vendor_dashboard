import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Auth/login_controller.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_sizes.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
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
              if (isLarge)
                Image(image: AssetImage("assets/images/login_bg.png")),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
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
                                    child: SvgPicture.asset(
                                        "assets/icons/logo.svg"),
                                  ),
                                ),
                          Gap(AppSizes().getHeightPercentage(20)),
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
                          Gap(AppSizes().getHeightPercentage(2)),
                          SizedBox(
                              width: isLarge
                                  ? MediaQuery.of(context).size.width * 0.4
                                  : MediaQuery.of(context).size.width * 0.9,
                              child: CustomTextField(
                                  hintText: "Please enter your email here",
                                  isSuffixIcon: true,
                                  icon: Icons.mail_outline_rounded,
                                  controller: loginController.emailController)),
                          Gap(AppSizes().getHeightPercentage(2)),
                          SizedBox(
                              width: isLarge
                                  ? MediaQuery.of(context).size.width * 0.4
                                  : MediaQuery.of(context).size.width * 0.9,
                              child: CustomTextField(
                                  hintText: "Password",
                                  isSuffixIcon: true,
                                  obsecrureFun: true,
                                  controller:
                                      loginController.passwordController)),
                          Gap(6),
                          SizedBox(
                            width: isLarge
                                ? MediaQuery.of(context).size.width * 0.4
                                : MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomChexBox(
                                    text: "Remember me",
                                    loginController: loginController),
                                GestureDetector(
                                  onTap: () {},
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
                          Gap(32),
                          SizedBox(
                            width: isLarge
                                ? MediaQuery.of(context).size.width * 0.4
                                : MediaQuery.of(context).size.width * 0.9,
                            child: CustomElevatedButton(
                              onPress: () {},
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
