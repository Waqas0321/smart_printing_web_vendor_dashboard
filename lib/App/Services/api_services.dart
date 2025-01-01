import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:smart_printing_web/App/Models/add_employ_model.dart';
import 'package:smart_printing_web/App/Models/get_employee_model.dart';
import 'package:smart_printing_web/App/Models/get_product_model.dart';
import 'package:smart_printing_web/App/Services/prefrence_services.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Models/product_model.dart';
import '../Routes/app_routes_name.dart';
import '../Widgets/custom_dialgue_box.dart';

class ApiServices {
  String baseUrl = "https://360-hour-print.vercel.app";

  final showToast = ShowToast();
  final dio = Dio();

  /// Login Admin
  Future<void> loginWithEmailPassword(String url, Map<String, String> requestBody) async {

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
        await SharedPreferencesService.setString('token', responseData['token']);
        showToast.showTopToast(message);
        Get.toNamed(AppRoutesName.homeScreen);
      } else {
        final errorMessage = response.data['message'] ?? 'Something went wrong!';
        showToast.showTopToast(errorMessage);
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        final errorResponse = dioError.response?.data;
        final errorMessage = errorResponse['message'] ?? 'An error occurred during login.';
        print("Error Response: ${dioError.response}");
        showToast.showTopToast(errorMessage);
      } else {
        print("Dio Error: $dioError");
        showToast.showTopToast('Network error or server not reachable.');
      }
    } catch (e) {
      print("Exception: $e");
      showToast.showTopToast('An unexpected error occurred: $e');
    }
  }
  /// Forget Password Function
  Future<void> forgetPassword(String url, Map<String, dynamic> requestData) async {
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
        showToast.showTopToast('${response.data['message'] ?? 'No message provided.'}');
        Get.toNamed(AppRoutesName.loginScreen);
      } else {
        print("Error Response: ${response.data}");
        showToast.showTopToast(response.data['message'] ?? 'Something went wrong.');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        print("Dio Error Response: ${dioError.response?.data}");
        showToast.showTopToast(dioError.response?.data['message'] ?? 'Error occurred.');
      } else {
        print("Dio Error: $dioError");
        showToast.showTopToast('Network error or server unreachable.: $dioError');
      }
    } catch (e) {
      print("Exception: $e");
      showToast.showTopToast('Unexpected error: $e');
    }
  }
  /// Create new password
  Future<void> newPassword(bool isLarge, String url, Map<String, String> requestBody) async {
    try {
      final response = await dio.post(
        baseUrl + url,
        data: requestBody,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        showToast.showTopToast('${response.data['message'] ?? 'No message provided.'}');
        showToast.showTopToast('Go to your login screen');
        final String url =
            "https://spw-vendor-dashboard.vercel.app/";
        Get.dialog(
          CustomDialgueBox(
            isFirst: true,
            isLarge: isLarge,
            onPress: () async{
              final Uri uri = Uri.parse(url);
              if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
              throw 'Could not launch $url';
              }
            },
          ),
          barrierDismissible:
          false, // Prevent closing by tapping outside
        );
      } else {
        showToast.showTopToast(response.data['message'] ?? 'Something went wrong.');
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        showToast.showTopToast(dioError.response?.data['message'] ?? 'Error occurred.');
      } else {
        showToast.showTopToast('Network error or server unreachable.');
      }
    } catch (e) {
      print("Exception: $e");
      showToast.showTopToast('Unexpected error: $e');
    }
  }
  /// Add Employee
  Future<void> addEmployee(AddEmployeeModel employee,String url) async {
    print("Profile Image Here :${employee.profileImage}");
    String apiUrl = baseUrl + url;
    String? token = await SharedPreferencesService.getString('token');
    try {
      final response = await dio.post(
        apiUrl,
        data: employee.toJson(),
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token"
        }),
      );
      print("Response Status Code : ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("${response.data["message"]}");
        ShowToast().showTopToast("${response.data["message"]}");
      } else {
        print("${response.statusCode}");
        ShowToast().showTopToast("${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }
  /// Get Employees
  Future<List<GetEmployeeModel>> getEmployees(String endpoint) async {
    String apiUrl = "$baseUrl$endpoint";
    String? token = await SharedPreferencesService.getString('token');
    print("Token from Shared Preferences: $token");
    try {
      final response = await dio.get(
        apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $token",
          },
        ),
      );
      print("Response Status Code: ${response.statusCode}");
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData["success"] != true || responseData["data"] == null) {
          print("Invalid or missing data in the response.");
          return [];
        }
        final employeesData = responseData["data"] as List<dynamic>;
        if (employeesData.isEmpty) {
          print("No employees data found.");
          ShowToast().showTopToast("No employees found.");
          return [];
        }
        return employeesData
            .map<GetEmployeeModel>((json) => GetEmployeeModel.fromJson(json))
            .toList();
      } else {
        print("API error with status code: ${response.statusCode}");
        return [];
      }
    } catch (error) {
      print("Error occurred: $error");
      return [];
    }
  }

  ///Post Product
  Future<void> postProduct(String url, GetProductResponse product) async {
    try {
      String apiUrl = '$baseUrl$url';
      String? token = await SharedPreferencesService.getString('token');

      if (token == null || token.isEmpty) {
        print("Error: No token found in SharedPreferences.");
        return;
      }
      print("Shared Preference Token: $token");
      final response = await dio.post(
        apiUrl,
        data: product.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Product added successfully: ${response.data}");
      } else {
        print("Failed to add product. Status code: ${response.statusCode}, Response: ${response.data}");
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        print(
            "DioError: ${dioError.response?.statusCode} - ${dioError.response?.data}");
      } else {
        print("DioError: ${dioError.message}");
      }
    } catch (e) {
      print("Unexpected error occurred while posting product: $e");
    }
  }

  /// Get Products
  Future<List<GetProduct>> getProduct(String url) async {
    try {
      String apiUrl = '$baseUrl$url';
      String? token = await SharedPreferencesService.getString('token');
      print("Shared Preference Token: $token");
      final response = await dio.get(
        apiUrl,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $token",
          },
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> productData = response.data["products"];
        return productData
            .map((json) => GetProduct.fromJson(json))
            .toList();
      } else {
        print("Failed to retrieve products. Status code: ${response.statusCode}, Response: ${response.data}");
        return [];
      }
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        print("DioError: ${dioError.response?.statusCode} - ${dioError.response?.data}");
      } else {
        print("DioError: ${dioError.message}");
      }
      return [];
    } catch (e) {
      print("Unexpected error occurred while retrieving products: $e");
      return [];
    }
  }





}
