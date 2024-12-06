import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Bindings/initial_bindings.dart';
import 'package:smart_printing_web/App/Routes/app_routes.dart';
import 'package:smart_printing_web/App/Routes/app_routes_name.dart';
import 'package:smart_printing_web/App/Utils/AppTheme/app_theme.dart';
import 'package:smart_printing_web/App/Utils/Const/appStrings.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appTitle,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      initialRoute: AppRoutesName.loginScreen,
      getPages: AppRoutes.routes,
    );
  }
}