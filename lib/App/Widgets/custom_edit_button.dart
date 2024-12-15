import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Utils/Const/appColors.dart';
import '../Utils/Const/app_icons.dart';
class CustomEditButton extends StatelessWidget {
  const CustomEditButton({
    super.key,this.height = 28,
    this.width = 28,
  });
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: AppColors.black,
          shape: BoxShape.circle
      ),
      child: Center(child: SvgPicture.asset(AppIcons.editSquare),),
    );
  }
}