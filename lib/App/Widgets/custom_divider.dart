import 'package:flutter/material.dart';
import '../Utils/Const/appColors.dart';
class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.color = AppColors.halfWhite2,
    this.thickness = 1.3,
  });
  final Color color;
  final double thickness ;

  @override
  Widget build(BuildContext context) {
    return Divider(color: color,thickness:thickness,);
  }
}
class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    super.key, required this.height,
  });
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: VerticalDivider(color: AppColors.brown,thickness: 0.8,));
  }
}