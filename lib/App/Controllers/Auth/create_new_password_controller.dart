import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';

class CreateNewPasswordController extends GetxController {
  // Text field controller
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKeyCreatePassword = GlobalKey<FormState>();
  final apiServices = ApiServices();
  RxString token = ''.obs;
  RxString baseUrl = ''.obs;
  String? fragment = '';
  // late final AppLinks appLinks;
  void setToken(String newToken) {
    token.value = newToken;
  }
  RxBool isLoading = false.obs;
  Future<void> createNewPassword(bool isLarge) async {
    try {
      isLoading.value = true;
      await apiServices.newPassword(
          isLarge,
          "/vendor/resetPassword",
          {
            "token": token.value.toString(),
            "newPassword": createPasswordController.text,
          });
    } catch (e) {
      return print(e);
    } finally {
      createPasswordController.clear();
      confirmPasswordController.clear();
      isLoading.value = false;
    }
  }
}
