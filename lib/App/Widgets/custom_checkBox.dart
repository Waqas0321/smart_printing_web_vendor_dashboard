import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/Auth/login_controller.dart';
import '../Utils/Const/appColors.dart';
import 'custom_text_widget.dart';

class CustomChexBox extends StatelessWidget {
  const CustomChexBox({
    super.key,
    required this.loginController,
    required this.text,
  });

  final LoginController loginController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => Checkbox(
                value: loginController.isChecked.value,
                onChanged: loginController.toggleCheckbox,
                activeColor: AppColors.lightPrimary,
                checkColor: AppColors.tertiary,
              ),
            ),
          ),
          CustomTextWidget(
            text: text,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            textColor: AppColors.tertiary,
          ),
        ],
      ),
    );
  }
}
