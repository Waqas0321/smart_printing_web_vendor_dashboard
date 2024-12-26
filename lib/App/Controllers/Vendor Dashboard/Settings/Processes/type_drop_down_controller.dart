import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TypeDropDownController extends GetxController{
  List<TextEditingController> directTier1Controllers = [];
  List<TextEditingController> directTier2Controllers = [];
  List<TextEditingController> directTier3Controllers = [];
  List<TextEditingController> percentControllers = [];

  var selectedValues = <RxString>[].obs;
  TextEditingController laminationTypeController = TextEditingController();
  RxList<String> laminationTypes = <String>[].obs;
  void addLaminationType() {
    if (laminationTypeController.text.trim().isNotEmpty) {
      laminationTypes.add(laminationTypeController.text.trim());
      laminationTypeController.clear();
    }
  }
  void removeLaminationType(int index) {
    laminationTypes.removeAt(index);
  }
  @override
  void onInit() {
    super.onInit();
    initializeControllers(laminationTypes.length);
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
    for (int index = 0; index <laminationTypes.length; index++) {
      String directTier1 = directTier1Controllers[index].text;
      String directTier2 = directTier2Controllers[index].text;
      String directTier3 = directTier3Controllers[index].text;
      // Collect percentile value
      String percentile = percentControllers[index].text;
      // Collect selected radio value (Increase/Decrease)
      String selectedValue = selectedValues[index].value;
      // Collect the current `cRequiredQuantity` list
      List<String> requiredQuantities = laminationTypes;
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