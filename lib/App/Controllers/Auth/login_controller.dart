import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  // Text field Controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Method to toggle the checkbox value
  RxBool isChecked = false.obs;
  void toggleCheckbox(bool? value) {
    isChecked.value = value ?? false;
  }

}