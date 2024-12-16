import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../Utils/Const/appColors.dart';
import 'custom_text_button.dart';
import 'custom_text_widget.dart';

class CustomPaginationClass extends StatelessWidget {
  const CustomPaginationClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomTextWidget(
          text: "Showing 10 of 30 Result",
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 0.5,color: AppColors.primary)
          ),
          child: CustomTextWidget(
            text: "Previous",
            textColor: AppColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(8),
        CustomTextButton(
          color: AppColors.lightPrimary,
          text: "01",
          hasBorder: false,
          textColor: AppColors.brown,
          onPress: () {},
        ),
        Gap(8),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 0.5,color: AppColors.primary)
          ),
          child: CustomTextWidget(
            text: "  Next  ",
            textColor: AppColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),

      ],
    );
  }
}