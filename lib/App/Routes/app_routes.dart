import 'package:get/get.dart';
import 'package:smart_printing_web/App/Routes/app_routes_name.dart';
import 'package:smart_printing_web/App/Views/Auth/login_screen.dart';

class AppRoutes{

  static final routes=[
    GetPage(name: AppRoutesName.loginScreen, page: () => LoginScreen(),)
  ];
}