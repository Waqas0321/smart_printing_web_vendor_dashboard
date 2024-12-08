import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:smart_printing_web/App/Utils/Const/app_icons.dart';
import 'package:smart_printing_web/App/Widgets/custom_textfield.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_images.dart';
import '../Utils/Const/app_sizes.dart';
import 'custom_divider.dart';
import 'custom_text_widget.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required this.controller,
    required this.isLarge,
  });

  final TextEditingController controller;
  final bool isLarge;


  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes().getWidthPercentage(100),
      padding:
          AppSizes().getCustomPadding(top: 1, bottom: 1, left: 1, right: 1),
      decoration: BoxDecoration(color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isSearching? widget.isLarge?CustomTextWidget(
            text: "Good Morning, John!",
            fontWeight: FontWeight.w600,
            fontSize: 21,
            textColor: AppColors.brown,
          ) :SizedBox(
              height: 36,
              width: AppSizes().getWidthPercentage(45),
              child: CustomTextField(
                controller: widget.controller,
                hasPrefixIcon: true,
                borderRadius: 8,
                hintText: "Search...",
              )) :CustomTextWidget(
            text: "Good Morning, John!",
            fontWeight: FontWeight.w600,
            fontSize: 21,
            textColor: AppColors.brown,
          ),
          Spacer(),
          widget.isLarge
              ? SizedBox(
                  height: 36,
                  width: AppSizes().getWidthPercentage(18),
                  child: CustomTextField(
                    controller: widget.controller,
                    hasPrefixIcon: true,
                    borderRadius: 8,
                    hintText: "Search...",
                  ))
              : GestureDetector(
                  onTap: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                  },
                  child: Icon(
                    Icons.search_sharp,
                    color: AppColors.brown.withOpacity(0.6),
                    size: 30,
                  ),
                ),
          Gap(12),
          SvgPicture.asset(AppIcons.bell),
          widget.isLarge
              ? CustomVerticalDivider(
                  height: 25,
                )
              : SizedBox.shrink(),
          widget.isLarge ? Gap(12) : SizedBox.shrink(),
          CircleAvatar(
            backgroundImage: AssetImage(AppImages.profileImage),
            radius: 20,
          ),
          widget.isLarge ? Gap(12) : SizedBox.shrink(),
          widget.isLarge
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: "John Smith",
                      fontSize: 13,
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomTextWidget(
                      text: "Admin",
                      fontSize: 8,
                      textColor: AppColors.brown,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              : SizedBox.shrink(),
          Gap(6),
          Icon(
            CupertinoIcons.chevron_down,
            color: AppColors.black,
            size: 18,
          )
        ],
      ),
    );
  }
}
