import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import '../../../../Models/employ_model.dart';

class EmployeesDetailsController extends GetxController{
  //check box
  List<RxBool> boolList = List.generate(10, (_) => false.obs);

  void toggleCheckbox(int index, bool? value) {
    if (index >= 0 && index < boolList.length) {
      boolList[index].value = value ?? false;
    }
  }
  RxInt selectedIndexEmployee = 0.obs;
  Future<List<EmployeeModel>> fetchEmployees() async {
    String endpoint = "/vendor/getEmployee";
    return await ApiServices().getEmployees(endpoint);
  }

}