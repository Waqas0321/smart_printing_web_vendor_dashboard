import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEmployeeController extends GetxController{
  // Multiple checkbox states
  RxBool isChecked = false.obs;
  RxBool isCheckedTwo = false.obs;
  RxBool isCheckedThree = false.obs;
  RxBool isCheckedFour = false.obs;
  RxBool isCheckedFive = false.obs;
  RxBool isCheckedSix = false.obs;

  // Function to toggle checkbox state
  void toggleCheckbox(RxBool checkBoxState) {
    checkBoxState.value = !checkBoxState.value; // Toggle the state of the passed RxBool
  }

  TextEditingController nameController = TextEditingController();
  RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;
  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      selectedFiles.addAll(result.files);
    }
  }
  void removePDF(int index) {
    selectedFiles.removeAt(index);
  }
  RxInt selectedIndexEmployee = 0.obs;

}