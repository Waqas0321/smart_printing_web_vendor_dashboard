import 'package:flutter/material.dart';

import '../../Const/appColors.dart';

class CheckBoxTheme {
  static CheckboxThemeData lightChecBoxTheme() {
    return CheckboxThemeData(
        side: BorderSide(color: AppColors.tertiary, width: 1));
  }
}
