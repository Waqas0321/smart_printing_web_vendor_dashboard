import 'dart:io';
import 'dart:typed_data' as typed_data;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/api_services.dart';
import '../../../../Models/employ_model.dart';

class AddEmployeeController extends GetxController {
  Permissions permissions = Permissions();

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
  RxString profileImageUrl = "".obs;
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
  RxList<String> fileUrls = <String>[].obs;
  RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;
  Future<void> pickAndUploadPDFs() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );
    if (result != null) {
      selectedFiles.addAll(result.files);
      for (var file in result.files) {
        String fileName =
            "${DateTime.now().millisecondsSinceEpoch}_${file.name}";
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child('files/$fileName');
        try {
          if (file.bytes != null) {
            typed_data.Uint8List fileBytes = file.bytes!;
            UploadTask uploadTask = firebaseStorageRef.putData(fileBytes);
            TaskSnapshot snapshot = await uploadTask;
            String downloadUrl = await snapshot.ref.getDownloadURL();
            print("File Url :$downloadUrl");
            fileUrls.add(downloadUrl);
            print(fileUrls);
          } else {
            print("Error: File has no valid bytes or path.");
          }
        } catch (e) {
          print("Error uploading file: $e");
        }
      }
    }
    print('Uploaded file URLs: ${fileUrls.join(', ')}');
  }
  void removePDF(int index) {
    selectedFiles.removeAt(index);
    fileUrls.removeAt(index);
    print(fileUrls);
  }

  /// Navigate Pages indexes
  RxInt selectedIndexEmployee = 0.obs;

  /// Upload to backend
  Future<void> handleAddEmployee() async {
    permissions = Permissions(
      provideEstimation: provideEstimationCheckbox.value,
      createEmployee: createEmployeeCheckbox.value,
      editWorkFlow: editWorkFlowCheckbox.value,
      createOrder: createOrderCheckbox.value,
      addProcesses: addProcessesCheckbox.value,
      machineOperatorDashboard: machineOperatorDashboardCheckbox.value,
    );
    EmployeeModel employee = EmployeeModel(
      name: nameController.text.trim(),
      email: emailAddressController.text.trim(),
      position: positionController.text.trim(),
      phone: phoneNumberController.text.trim(),
      profileImage: profileImageUrl.value.toString(),
      otherFiles: fileUrls,
      userID: userIDController.text.trim(),
      password: passwordController.text.trim(),
      permissions: permissions,
    );
    String url = '/vendor/addEmployee';
    // Call the API function
    await ApiServices().addEmployee(employee, url);
  }
}
