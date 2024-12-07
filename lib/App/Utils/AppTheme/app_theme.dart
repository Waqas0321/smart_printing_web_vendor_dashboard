import 'package:flutter/material.dart';
import 'package:smart_printing_web/App/Utils/AppTheme/Customs/checkBox_theme.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';

class AppTheme {

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
        useMaterial3: true, scaffoldBackgroundColor: AppColors.white,
      checkboxTheme: CheckBoxTheme.lightChecBoxTheme()
    );
  }

  // Dark theme
  static ThemeData get darkTheme {
    return ThemeData(
        useMaterial3: true, scaffoldBackgroundColor: AppColors.white);
  }
}
