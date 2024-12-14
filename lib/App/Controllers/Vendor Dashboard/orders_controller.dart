import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController{
  RxList<PlatformFile> selectedFiles = <PlatformFile>[].obs;
  TextEditingController estimationIDController = TextEditingController();
  var selectedType1 = "Type 1".obs;
  var selectedType2 = "Type 1".obs;

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

  // Navigations
  RxInt selectedIndex = 0.obs;
  RxBool otherScreen = false.obs;
  //check box
  List<RxBool> boolList = List.generate(10, (_) => false.obs);

  void toggleCheckbox(int index, bool? value) {
    if (index >= 0 && index < boolList.length) {
      boolList[index].value = value ?? false;
    }
  }

}