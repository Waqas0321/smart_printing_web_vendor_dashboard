import 'package:get/get.dart';
import 'package:smart_printing_web/App/Models/get_employee_model.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';

class EmployeesDetailsController extends GetxController {

  ///check box
  RxList<String> selectedEmployees = <String>[].obs;
  void toggleSelection(String productId, bool isSelected) {
    if (isSelected) {
      selectedEmployees.add(productId);
    } else {
      selectedEmployees.remove(productId);
    }
    print('Selected Employee IDs: ${selectedEmployees}');
  }
  RxInt selectedIndexEmployee = 0.obs;

  Future<List<GetEmployeeModel>> fetchEmployees() async {
    String endpoint = "/vendor/getEmployee";
    return await ApiServices().getEmployees(endpoint);
  }

/// Delete Employees
  Future<void> deleteEmployees() async {
    try {
     await ApiServices().deleteApi("/vendor/delEmployees/", selectedEmployees);
     fetchEmployees();
    } catch (e) {
      print("Exception: $e");
    }
  }
}
