import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_links/app_links.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';

class CreateNewPasswordController extends GetxController {
  // Text field controller
  TextEditingController createPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final apiServices = ApiServices();
  RxString token = ''.obs;
  String? fragment = '';
  // late final AppLinks appLinks;
  void setToken(String newToken) {
    token.value = newToken;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   initializeAppLinks();
  // }
  // Future<void> initializeAppLinks() async {
  //   appLinks = AppLinks();
  //   try {
  //     final Uri? initialUri = await appLinks.getInitialLink();
  //     if (initialUri != null) {
  //       handleIncomingLink(initialUri);
  //     }
  //   } catch (e) {
  //     print('Failed to get initial link: $e');
  //   }
  //   appLinks.uriLinkStream.listen((Uri? uri) {
  //     if (uri != null) {
  //       handleIncomingLink(uri);
  //     }
  //   }, onError: (Object err) {
  //     print('Failed to receive link: $err');
  //   });
  // }
  // void handleIncomingLink(Uri uri) {
  //    fragment = uri.fragment; // Extract fragment after '#'
  //   Uri fragmentUri = Uri.parse('?$fragment');
  //   token.value = fragmentUri.queryParameters['token'] ?? '';
  //   if (token.isNotEmpty) {
  //     print('Token: $token');
  //   } else {
  //     print('No token found in the URI fragment.');
  //   }
  // }

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
