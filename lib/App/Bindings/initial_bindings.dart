import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Auth/login_controller.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {

    //login intialize
   Get.lazyPut(() => LoginController(),);
   Get.put(() => LoginController(),);
  }

}