import 'package:get/get.dart';
import 'package:smart_printing_web/App/Models/get_employee_model.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import '../../../../Models/add_employ_model.dart';
import 'package:http/http.dart' as http;

class EmployeesDetailsController extends GetxController{
  //check box
  List<RxBool> boolList = List.generate(100, (_) => false.obs);

  void toggleCheckbox(int index, bool? value) {
    if (index >= 0 && index < boolList.length) {
      boolList[index].value = value ?? false;
    }
  }
  RxInt selectedIndexEmployee = 0.obs;
  Future<List<GetEmployeeModel>> fetchEmployees() async {
    String endpoint = "/vendor/getEmployee";
    return await ApiServices().getEmployees(endpoint);
  }



  Future<bool> isImageUrlValid(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);
      if (response.statusCode == 200) {
        // You can further check the content-type if necessary
        if (response.headers['content-type']?.contains('image/jpeg') ?? false) {
          return true;
        }
      }
    } catch (e) {
      print('Error checking URL: $e');
    }
    return false;
  }
}