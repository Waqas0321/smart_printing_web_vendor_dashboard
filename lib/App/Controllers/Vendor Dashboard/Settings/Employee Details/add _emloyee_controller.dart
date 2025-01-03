import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import '../../../../Models/add_employ_model.dart';
import '../../../../Services/image_picker_services.dart';
import 'emplyees_details_controller.dart';

class AddEmployeeController extends GetxController {
  Permissions permissions = Permissions();
  final employeeDetailsController = Get.put(EmployeesDetailsController());
  final imageService = Get.put(ImagePickerService());

  /// Form key here
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// Profile Image
  Rx<File?> selectedImage = Rx<File?>(null);

  /// Multiple checkbox states for permissions
  RxBool provideEstimationCheckbox = false.obs;
  RxBool createEmployeeCheckbox = false.obs;
  RxBool editWorkFlowCheckbox = false.obs;
  RxBool createOrderCheckbox = false.obs;
  RxBool addProcessesCheckbox = false.obs;
  RxBool machineOperatorDashboardCheckbox = false.obs;

  void toggleCheckbox(
      RxBool checkbox, String permissionKey, Permissions permissions) {
    checkbox.value = !checkbox.value;
    permissions.updatePermission(permissionKey, checkbox.value);
  }

  /// PDf files pick & Upload to firebase
  RxList<File?> selectedFiles = <File?>[].obs;
  Future<void> pickAndUploadPDFs() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      selectedFiles.addAll(result.files.map((platformFile) {
        if (platformFile.path != null) {
          return File(platformFile.path!);
        }
        return null;
      }).toList());
      print('Picked files: ${selectedFiles.map((file) => file?.path).toList()}');
    } else {
      print('No files were selected.');
    }
  }
  void removePDF(int index) {
    selectedFiles.removeAt(index);
  }
  /// Navigate Pages indexes
  RxInt selectedIndexEmployee = 0.obs;
  /// Upload to backend
  RxBool isLoading = false.obs;
  Future<void> addEmployee() async {
    try{
      isLoading.value = true;
      permissions = Permissions(
        provideEstimation: provideEstimationCheckbox.value,
        createEmployee: createEmployeeCheckbox.value,
        editWorkFlow: editWorkFlowCheckbox.value,
        createOrder: createOrderCheckbox.value,
        addProcesses: addProcessesCheckbox.value,
        machineOperatorDashboard: machineOperatorDashboardCheckbox.value,
      );
      AddEmployeeModel employee = AddEmployeeModel(
        name: nameController.text.trim(),
        email: emailAddressController.text.trim(),
        position: positionController.text.trim(),
        phone: phoneNumberController.text.trim(),
        profileImage: selectedImage.value!,
        otherFiles: selectedFiles.value,
        userID: userIDController.text.trim(),
        password: passwordController.text.trim(),
        permissions: permissions,
      );
      String url = '/vendor/addEmployee';
      await ApiServices().addEmployee(employee, url);
      provideEstimationCheckbox.value = false;
      createOrderCheckbox.value = false;
      editWorkFlowCheckbox.value = false;
      createEmployeeCheckbox.value = false;
      machineOperatorDashboardCheckbox.value = false;
      addProcessesCheckbox.value = false;
      nameController.clear();
      emailAddressController.clear();
      positionController.clear();
      phoneNumberController.clear();
      userIDController.clear();
      passwordController.clear();
      selectedFiles.value = [];
      selectedImage.value = null;
      selectedFiles.value = [];
      imageService.selectedImage = Rx<File?>(null);
      employeeDetailsController.selectedIndexEmployee.value = 0;
      selectedIndexEmployee.value = 0;

    }catch(e){
      print("Exception: $e");
    }finally{
      isLoading.value = false;
    }


  }
}
