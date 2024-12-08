import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Auth/create_new_password_controller.dart';
import 'package:smart_printing_web/App/Controllers/Auth/forget_password_controller.dart';
import 'package:smart_printing_web/App/Controllers/Auth/login_controller.dart';

import '../Controllers/Vendor Dashboard/home_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {

    //login intialize
   Get.lazyPut(() => LoginController(),);
   Get.put(() => LoginController(),);

   //forget password intialize
   Get.lazyPut(() => ForgetPasswordController(),);
   Get.put(() => ForgetPasswordController(),);

   //create new password intialize
   Get.lazyPut(() => CreateNewPasswordController(),);
   Get.put(() => CreateNewPasswordController(),);

   //Vendor Dashboard Home
   Get.lazyPut(() => HomeController(),);
   Get.put(() => HomeController(),);
  }

}