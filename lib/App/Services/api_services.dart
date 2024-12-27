import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';
import 'package:smart_printing_web/App/Views/Auth/login_screen.dart';
import '../Views/Vendor Dashboard/home_screen.dart';
import '../Widgets/custom_dialgue_box.dart';

class ApiServices {
  String baseUrl = "https://360-hour-print.vercel.app";
  final showToast = ShowToast();

  Future<void> loginWithEmailPassword(String url, Map<String, String> requestBody) async {
    final dio = Dio();
    try {
      final response = await dio.post(
        baseUrl + url,
        data: requestBody,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      if (response.statusCode == 200) {
        final responseData = response.data;
        final message = responseData['message'] ?? 'Login successful!';
        print("Response: ${response.data}");
        showToast.showTopRightToast(message);
        Get.to(HomeScreen());
      } else {
        final errorMessage = response.data['message'] ?? 'Something went wrong!';
        showToast.showTopRightToast(errorMessage);
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        final errorResponse = dioError.response?.data;
        final errorMessage = errorResponse['message'] ?? 'An error occurred during login.';
        print("Error Response: ${dioError.response}");
        showToast.showTopRightToast(errorMessage);
      } else {
        print("Dio Error: $dioError");
        showToast.showTopRightToast('Network error or server not reachable.');
      }
    } catch (e) {
      print("Exception: $e");
      showToast.showTopRightToast('An unexpected error occurred: $e');
    }
  }
  Future<void> forgetPassword(String url, Map<String, dynamic> requestData) async {
    final dio = Dio();
    try {
      final response = await dio.post(
        baseUrl + url,
        data: requestData,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Response: ${response.data}");
        showToast.showTopRightToast('${response.data['message'] ?? 'No message provided.'}');
      } else {
        print("Error Response: ${response.data}");
        showToast.showTopRightToast(response.data['message'] ?? 'Something went wrong.');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        print("Dio Error Response: ${dioError.response?.data}");
        showToast.showTopRightToast(dioError.response?.data['message'] ?? 'Error occurred.');
      } else {
        print("Dio Error: $dioError");
        showToast.showTopRightToast('Network error or server unreachable.');
      }
    } catch (e) {
      print("Exception: $e");
      showToast.showTopRightToast('Unexpected error: $e');
    }
  }
  Future<void> newPassword(bool isLarge, String url, Map<String, dynamic> requestData) async {
    final dio = Dio();
    try {
      final response = await dio.post(
        baseUrl + url,
        data: requestData,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Response: ${response.data}");
        showToast.showTopRightToast('Request successful: ${response.data['message'] ?? 'No message provided.'}');
        Get.dialog(
          CustomDialgueBox(
            isFirst: true,
            isLarge: isLarge,
            onPress: () {
              Get.to(LoginScreen());
            },
          ),
          barrierDismissible:
          false, // Prevent closing by tapping outside
        );
      } else {
        print("Error Response: ${response.data}");
        showToast.showTopRightToast(response.data['message'] ?? 'Something went wrong.');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        print("Dio Error Response: ${dioError.response?.data}");
        showToast.showTopRightToast(dioError.response?.data['message'] ?? 'Error occurred.');
      } else {
        print("Dio Error: $dioError");
        showToast.showTopRightToast('Network error or server unreachable.');
      }
    } catch (e) {
      print("Exception: $e");
      showToast.showTopRightToast('Unexpected error: $e');
    }
  }





}
