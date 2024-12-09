import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Auth/create_new_password_controller.dart';
import 'package:smart_printing_web/App/Controllers/Auth/forget_password_controller.dart';
import 'package:smart_printing_web/App/Controllers/Auth/login_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/processes_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/product_details_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/estimation_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/help_center_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/history_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/orders_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/overview_controller.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/settings_controller.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/employees_details_screen.dart';
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

   //Vendor Dashboard OverView
   Get.lazyPut(() => OverviewController(),);
   Get.put(() => OverviewController(),);

   //Vendor Dashboard Estimation
   Get.lazyPut(() => EstimationController(),);
   Get.put(() => EstimationController(),);

   //Vendor Dashboard Orders
   Get.lazyPut(() => OrdersController(),);
   Get.put(() => OrdersController(),);

   //Vendor Dashboard History
   Get.lazyPut(() => HistoryController(),);
   Get.put(() => HistoryController(),);

   //Vendor Dashboard Settings
   Get.lazyPut(() => SettingsController(),);
   Get.put(() => SettingsController(),);

   //Vendor Dashboard Settings Product Details
   Get.lazyPut(() => ProductDetailsController(),);
   Get.put(() => ProductDetailsController(),);

   //Vendor Dashboard Settings Product Details
   Get.lazyPut(() => EmployeesDetailsScreen(),);
   Get.put(() => EmployeesDetailsScreen(),);

   //Vendor Dashboard Settings Product Details
   Get.lazyPut(() => ProcessesController(),);
   Get.put(() => ProcessesController(),);

   //Vendor Dashboard Help Center
   Get.lazyPut(() => HelpCenterController(),);
   Get.put(() => HelpCenterController(),);
  }

}