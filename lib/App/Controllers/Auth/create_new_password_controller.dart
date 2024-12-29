import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';
import 'package:uni_links/uni_links.dart';

import '../../Views/Auth/login_screen.dart';
import '../../Widgets/custom_dialgue_box.dart';

class CreateNewPasswordController extends GetxController {
  // Text field controllers
  final TextEditingController createPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // API services instance
  final apiServices = ApiServices();

  // Observables
  final RxString token = ''.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _handleDeepLinks();
  }

  /// Handles both deep link streams and initial link.
  void _handleDeepLinks() {
    _listenForDeepLinks();
    _checkInitialLink();
  }

  /// Listens for URI changes in the deep link stream.
  void _listenForDeepLinks() {
    uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        _extractTokenFromUri(uri);
      } else {
        print('No URI received.');
      }
    });
  }

  /// Checks the initial link when the app starts.
  Future<void> _checkInitialLink() async {
    try {
      final String? initialLink = await getInitialLink();
      if (initialLink != null) {
        final Uri initialUri = Uri.parse(initialLink);
        _extractTokenFromUri(initialUri);
      }
    } catch (e) {
      print('Error checking initial link: $e');
    }
  }

  /// Extracts the token from the provided URI.
  void _extractTokenFromUri(Uri uri) {
    print('Received URI: $uri');
    final String fragment = uri.fragment; // Extract fragment after '#'
    print('Fragment: $fragment');
    if (fragment.contains('?')) {
      final queryParams = Uri.splitQueryString(fragment.split('?').last);
      final extractedToken = queryParams['token'];
      if (extractedToken != null && extractedToken.isNotEmpty) {
        token.value = extractedToken;
        print('Token extracted: ${token.value}');
      } else {
        print('No token found in the fragment.');
      }
    } else {
      print('Fragment does not contain a query string.');
    }
  }

  /// Sends a request to create a new password.
  Future<void> createNewPassword(bool isLarge) async {
    if (token.value.isEmpty) {
      ShowToast().showTopToast("Token is : ${token.value}");
      return;
    }

    if (!formKey.currentState!.validate()) {
      ShowToast().showTopToast("Please fill all fields correctly.");
      return;
    }

    ShowToast().showTopToast("Processing request with token: ${token.value}");

    try {
      isLoading.value = true;

      // API request
      await apiServices.newPassword(
        isLarge,
        "/vendor/resetPassword",
        {
          "token": token.value, // Corrected token value type
          "newPassword": createPasswordController.text,
        },
      );

      ShowToast().showTopToast("Password updated successfully.");
    } catch (e) {
      print('Error creating new password: $e');
      ShowToast().showTopToast("Failed to update password.");
    } finally {
      _resetFields();
    }
  }

  /// Clears the form fields and resets the loading state.
  void _resetFields() {
    createPasswordController.clear();
    confirmPasswordController.clear();
    isLoading.value = false;
  }
}
