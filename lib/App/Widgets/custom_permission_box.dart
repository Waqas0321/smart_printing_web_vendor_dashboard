import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../Utils/Const/appColors.dart';
import 'custom_text_widget.dart';
class CustomPersmissionBox extends StatelessWidget {
  const CustomPersmissionBox({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onPress,
    required this.icon,
  });

  final String title;
  final RxBool isChecked;
  final Function(bool) onPress;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.halfWhite2.withOpacity(0.6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.brown.withOpacity(0.1),
              child: SvgPicture.asset(icon,color: AppColors.black,),
            ),
            Gap(8),
            CustomTextWidget(
              text: title,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              textColor: AppColors.black,
            ),
            const Spacer(),
            Obx(() => Checkbox(
              value: isChecked.value,
              onChanged: (value) => onPress(value!),
              activeColor: AppColors.primary,
            )),
            Gap(3),
          ],
        ),
      ),
    );
  }
}