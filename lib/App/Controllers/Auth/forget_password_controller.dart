import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';

class ForgetPasswordController extends GetxController{

  final apiServices = ApiServices();
  // Text field Controller
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  Future<void> forgetPassword() async {
    try {
      isLoading.value = true;
      await apiServices.forgetPassword(
          "/vendor/forgotPassword",
          {
            "email": emailController.text,
          });
    }catch(e){
      return print(e);
    }finally{
      emailController.clear();
      isLoading.value = false;
    }

  }

}