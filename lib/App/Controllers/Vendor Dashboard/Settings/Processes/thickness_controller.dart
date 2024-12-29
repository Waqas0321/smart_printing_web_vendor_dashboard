import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Models/thickness_model.dart';
import '../../../../Services/show_toast.dart';

class ThicknessController extends GetxController{
  List<TextEditingController> directTier1Controllers = [];
  List<TextEditingController> directTier2Controllers = [];
  List<TextEditingController> directTier3Controllers = [];
  List<TextEditingController> percentControllers = [];
  // Thickness
  TextEditingController basicLevelController = TextEditingController();
  TextEditingController mediumLevelController = TextEditingController();
  TextEditingController heavyLevelController = TextEditingController();
  RxList<Thickness> thickness = <Thickness>[].obs;
  void addThickness() {
    if (basicLevelController.text.trim().isNotEmpty &&
        mediumLevelController.text.trim().isNotEmpty &&
        heavyLevelController.text.trim().isNotEmpty) {
      // Add a new Thickness object to the list
      thickness.add(
        Thickness(
          basicLevel: basicLevelController.text.trim(),
          mediumLevel: mediumLevelController.text.trim(),
          heavyLevel: heavyLevelController.text.trim(),
        ),
      );

      // Clear the controllers after adding to the list
      basicLevelController.clear();
      mediumLevelController.clear();
      heavyLevelController.clear();
    } else {
      ShowToast().showTopToast("Please fill in all the fields before adding!");
    }
  }
  void removeThickness(int index) {
    thickness.removeAt(index);
  }

  var selectedValues = <RxString>[].obs;
  @override
  void onInit() {
    super.onInit();
    initializeControllers(thickness.length);
  }
  @override
  void onClose() {
    for (var controller in directTier1Controllers) {
      controller.dispose();
    }
    for (var controller in directTier2Controllers) {
      controller.dispose();
    }
    for (var controller in directTier3Controllers) {
      controller.dispose();
    }
    for (var controller in percentControllers) {
      controller.dispose();
    }
    super.onClose();
  }
  void initializeControllers(int length) {
    // Initialize controllers based on length
    directTier1Controllers = List.generate(length, (index) => TextEditingController());
    directTier2Controllers = List.generate(length, (index) => TextEditingController());
    directTier3Controllers = List.generate(length, (index) => TextEditingController());
    percentControllers = List.generate(length, (index) => TextEditingController());
    selectedValues.value = List.generate(length, (index) => "Increase".obs);
  }

  List<Map<String, dynamic>> collectUserInputs() {
    List<Map<String, dynamic>> resultList = [];
    for (int index = 0; index <thickness.length; index++) {
      String directTier1 = directTier1Controllers[index].text;
      String directTier2 = directTier2Controllers[index].text;
      String directTier3 = directTier3Controllers[index].text;
      // Collect percentile value
      String percentile = percentControllers[index].text;
      // Collect selected radio value (Increase/Decrease)
      String selectedValue = selectedValues[index].value;
      // Collect the current `cRequiredQuantity` list
      List<Thickness> requiredQuantities = thickness;
      // Create an object with the collected data
      Map<String, dynamic> inputObject = {
        "directTimer": {
          "tier1": directTier1,
          "tier2": directTier2,
          "tier3": directTier3,
        },
        "percentile": percentile,
        "adjustment": selectedValue,
        "requiredQuantities": requiredQuantities,
      };
      // Add the object to the result list
      resultList.add(inputObject);
    }
    // Return the complete list
    return resultList;
  }
  void handleSubmit() {
    List<Map<String, dynamic>> userInputs = collectUserInputs();
    sendDataToBackend(userInputs);
  }

  void sendDataToBackend(List<Map<String, dynamic>> data) {
    print("Sending data to backend: $data");
  }
}