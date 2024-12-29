import 'dart:html' as html; // For web-specific operations
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';
import 'package:uni_links/uni_links.dart';

class CreateNewPasswordController extends GetxController {
  // Text field controllers
  final TextEditingController createPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Services
  final ApiServices apiServices = ApiServices();

  // Observables
  RxString token = ''.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeDeepLinkHandling();
  }

  /// Initializes deep link handling for both mobile and web.
  void initializeDeepLinkHandling() {
    if (GetPlatform.isWeb) {
      _checkInitialLinkForWeb();
    } else {
      _checkInitialLinkForMobile();
    }
  }

  /// Handles the initial link for Flutter Web.
  void _checkInitialLinkForWeb() {
    try {
      final String currentUrl = html.window.location.href;
      final Uri uri = Uri.parse(currentUrl);
      String? fragment = uri.fragment; // Extract fragment after '#'
      Uri fragmentUri = Uri.parse('?$fragment'); // Parse fragment as query parameters
      token.value = fragmentUri.queryParameters['token'] ?? '';
      if (token.isNotEmpty) {
        print('Token extracted (Web): ${token.value}');
      } else {
        print('No token found in the URI fragment (Web).');
      }
    } catch (e) {
      print('Error checking initial link (Web): $e');
    }
  }

  /// Handles the initial link and stream for mobile platforms.
  void _checkInitialLinkForMobile() async {
    await _checkInitialLink();
    _listenForDeepLinks();
  }

  /// Checks the initial link when the app starts (mobile).
  Future<void> _checkInitialLink() async {
    try {
      final String? initialLink = await getInitialLink();
      if (initialLink != null) {
        final Uri initialUri = Uri.parse(initialLink);
        String? fragment = initialUri.fragment;
        Uri fragmentUri = Uri.parse('?$fragment');
        token.value = fragmentUri.queryParameters['token'] ?? '';
        if (token.isNotEmpty) {
          print('Token extracted (Mobile): ${token.value}');
        } else {
          print('No token found in the initial URI fragment (Mobile).');
        }
      }
    } catch (e) {
      print('Error checking initial link (Mobile): $e');
    }
  }

  /// Listens for deep link changes (mobile only).
  void _listenForDeepLinks() {
    try {
      uriLinkStream.listen((Uri? uri) {
        if (uri != null) {
          String? fragment = uri.fragment;
          Uri fragmentUri = Uri.parse('?$fragment');
          token.value = fragmentUri.queryParameters['token'] ?? '';
          if (token.isNotEmpty) {
            print('Token extracted from stream (Mobile): ${token.value}');
          } else {
            print('No token found in the URI fragment (Mobile).');
          }
        } else {
          print('No URI received (Mobile).');
        }
      }, onError: (error) {
        print('Error in uriLinkStream (Mobile): $error');
      });
    } catch (e) {
      print('Error setting up uriLinkStream (Mobile): $e');
    }
  }
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
