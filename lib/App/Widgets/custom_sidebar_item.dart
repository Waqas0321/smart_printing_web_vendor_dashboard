import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';

class SidebarItem extends StatelessWidget {
  final String icon;
  final String label;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isLarge;
  final String iconTwo;

  SidebarItem({
    required this.icon,
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.isLarge,
    this.iconTwo = AppIcons.dashboardFilledIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.lightPrimary : AppColors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                isSelected?iconTwo: icon,
                color: isSelected ? AppColors.black : AppColors.white,
                height: 18,
                width: 18,
              ),
              const SizedBox(width: 8), // Space between icon and text
              if (isLarge)
                Expanded(
                  child: CustomTextWidget(
                    textAlign: TextAlign.start,
                    text: label,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    textColor: isSelected ? AppColors.black : AppColors.white,
                  ),
                ),
              isLarge? Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: isSelected ? AppColors.black : AppColors.white,
              ):SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
