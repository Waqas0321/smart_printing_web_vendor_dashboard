import 'package:get/get.dart';
import 'package:smart_printing_web/App/Routes/app_routes_name.dart';
import 'package:smart_printing_web/App/Views/Auth/create_new_password_screen.dart';
import 'package:smart_printing_web/App/Views/Auth/forget_password_screen.dart';
import 'package:smart_printing_web/App/Views/Auth/login_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/home_screen.dart';

class AppRoutes{

  static final routes=[

    GetPage(name: AppRoutesName.loginScreen, page: () => LoginScreen(),),
    GetPage(name: AppRoutesName.forgetPasswordScreen, page: () => ForgetPasswordScreen(),),
    GetPage(name: AppRoutesName.createNewPasswordScreen, page: () => CreateNewPasswordScreen(),),

    //Vendor Dashboard
    GetPage(name: AppRoutesName.homeScreen, page: () => HomeScreen(),),
  ];
}