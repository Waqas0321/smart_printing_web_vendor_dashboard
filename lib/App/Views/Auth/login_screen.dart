import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Auth/login_controller.dart';

class LoginScreen extends StatelessWidget {
 const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold();
  }
}
