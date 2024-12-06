import 'package:flutter/material.dart';
import '../Utils/Const/appColors.dart';
class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.halfWhite2,thickness: 1.3,);
  }
}