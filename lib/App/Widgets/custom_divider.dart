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
    this.thickness = 0.8,
    this.color = AppColors.brown,
  });
  final double height;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: VerticalDivider(color: color,thickness: thickness,));
  }
}