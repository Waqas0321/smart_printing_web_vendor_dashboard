import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';

class LoginController extends GetxController{
  final apiServices = ApiServices();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Text field Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Method to toggle the checkbox value
  RxBool isChecked = false.obs;
  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }
  RxBool isLoading = false.obs;
  Future<void> login() async {
    try {
      isLoading.value = true;
      await apiServices.loginWithEmailPassword(
          "/vendor/login",
          {
            "email": emailController.text,
            "password": passwordController.text
          });
    }catch(e){
      return print(e);
    }finally{
      emailController.clear();
      passwordController.clear();
     isLoading.value = false;
  }

  }

}