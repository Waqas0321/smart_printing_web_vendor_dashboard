import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';
import 'package:uni_links/uni_links.dart';

class CreateNewPasswordController extends GetxController {
  // Text field controller
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final apiServices = ApiServices();
  RxString token = ''.obs;

  void onInit() {
    super.onInit();
    listenForDeepLinks();
    checkInitialLink();
  }

  void listenForDeepLinks() async {
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        String? fragment = uri.fragment; // Extract fragment after '#'
        Uri fragmentUri = Uri.parse('?$fragment');
        token.value = fragmentUri.queryParameters['token'] ?? '';
        if (token.isNotEmpty) {
          print('token : ${token}');
        } else {
          print('No token found in the URI fragment.');
        }
      } else {
        print('No URI received.');
      }
    });
  }

  void checkInitialLink() async {
    try {
      final String? initialLink = await getInitialLink();
      if (initialLink != null) {
        final Uri initialUri = Uri.parse(initialLink); // Parse the String into Uri
        String? fragment = initialUri.fragment;
        Uri fragmentUri = Uri.parse('?$fragment');
        token.value = fragmentUri.queryParameters['token'] ?? '';
        if (token.isNotEmpty) {
          print('Token extracted from initial link: $token');
        } else {
          print('No token found in the initial URI fragment.');
        }
      }
    } catch (e) {
      print('Error checking initial link: $e');
    }
  }


  RxBool isLoading = false.obs;
  Future<void> createNewPassword(bool isLarge) async {
    ShowToast().showTopToast("This is token : ${token.value}");
    try {
      isLoading.value = true;
      await apiServices.newPassword(
          isLarge,
          "/vendor/resetPassword",
          {
            "token": token,
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