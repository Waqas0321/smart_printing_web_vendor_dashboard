import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../Services/show_toast.dart';

class OperationalQuantityController extends GetxController{
  List<TextEditingController> directTier1Controllers = [];
  List<TextEditingController> directTier2Controllers = [];
  List<TextEditingController> directTier3Controllers = [];
  List<TextEditingController> percentControllers = [];
  var selectedValues = <RxString>[].obs;
  TextEditingController operationalQuantityController = TextEditingController();
  RxList<String> operationalQuantity = <String>[].obs;
  void addOperationalQuantity() {
    if (operationalQuantityController.text.trim().isNotEmpty) {
      if (_isNumeric(operationalQuantityController.text.trim())) {
        operationalQuantity.add(operationalQuantityController.text.trim());
        operationalQuantityController.clear();
      } else {
        ShowToast().showTopToast("Please enter a valid numeric value!");
      }
    } else {
      ShowToast().showTopToast("Please fill in the field before adding!");
    }
  }
  void removeOperationalQuantity(int index) {
    operationalQuantity.removeAt(index);
  }
  @override
  void onInit() {
    super.onInit();
    initializeControllers(operationalQuantity.length);
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
  bool _isNumeric(String value) {
    return double.tryParse(value) != null;
  }

  List<Map<String, dynamic>> collectUserInputs() {
    // Initialize an empty list to hold the results
    List<Map<String, dynamic>> resultList = [];

    // Loop through the required quantity indices
    for (int index = 0; index <operationalQuantity.length; index++) {
      // Collect values for direct timer
      String directTier1 = directTier1Controllers[index].text;
      String directTier2 = directTier2Controllers[index].text;
      String directTier3 = directTier3Controllers[index].text;

      // Collect percentile value
      String percentile = percentControllers[index].text;

      // Collect selected radio value (Increase/Decrease)
      String selectedValue = selectedValues[index].value;

      // Collect the current `cRequiredQuantity` list
      List<String> requiredQuantities = operationalQuantity;

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
    // Call the function to collect inputs
    List<Map<String, dynamic>> userInputs = collectUserInputs();

    // Log or print the result for verification
    print(userInputs);

    // Use the data as needed, e.g., send it to a backend API
    sendDataToBackend(userInputs);
  }

  void sendDataToBackend(List<Map<String, dynamic>> data) {
    // Example of sending data to a backend API
    print("Sending data to backend: $data");
  }
}