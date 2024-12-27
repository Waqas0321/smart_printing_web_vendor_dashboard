import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../Models/size_with_timer.dart';
import '../../../../Services/show_toast.dart';

class SizeWithTimerController extends GetxController{
  List<TextEditingController> directTier1Controllers = [];
  List<TextEditingController> directTier2Controllers = [];
  List<TextEditingController> directTier3Controllers = [];
  List<TextEditingController> percentControllers = [];
  // Side with Repetition
  // Size With Base Timer
  TextEditingController sBTLengthController = TextEditingController();
  TextEditingController sBTWidthController = TextEditingController();
  TextEditingController sBTHeightController = TextEditingController();
  RxString inch = "INCH".obs;
  RxString cm = "CM".obs;
  RxString selectedMeasurement = "CM".obs;
  RxList<SizeWithTimer> sizeWithTimer = <SizeWithTimer>[].obs;
  bool _isNumeric(String value) {
    return double.tryParse(value) != null;
  }
  void addSizeWithTimer() {
    // Check if all controllers have valid numeric values
    if (sBTLengthController.text.trim().isNotEmpty &&
        sBTWidthController.text.trim().isNotEmpty &&
        sBTHeightController.text.trim().isNotEmpty &&
        _isNumeric(sBTLengthController.text.trim()) &&
        _isNumeric(sBTWidthController.text.trim()) &&
        _isNumeric(sBTHeightController.text.trim())) {
      // Add a new SizeWithTimer object to the list
      sizeWithTimer.add(
        SizeWithTimer(
            length: double.parse(sBTLengthController.text.trim()),
            width: double.parse(sBTWidthController.text.trim()),
            height: double.parse(sBTHeightController.text.trim()),
            measurement: selectedMeasurement.toString()
        ),
      );
      // Clear the controllers after adding to the list
      sBTHeightController.clear();
      sBTWidthController.clear();
      sBTLengthController.clear();
    } else {
      ShowToast().showTopRightToast(
          "Please enter valid numeric values in all fields before adding!");
    }
  }
  void removeSizeWithTimer(int index) {
    sizeWithTimer.removeAt(index);
  }

  var selectedValues = <RxString>[].obs;
  @override
  void onInit() {
    super.onInit();
    initializeControllers(sizeWithTimer.length);
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
    for (int index = 0; index <sizeWithTimer.length; index++) {
      String directTier1 = directTier1Controllers[index].text;
      String directTier2 = directTier2Controllers[index].text;
      String directTier3 = directTier3Controllers[index].text;

      // Collect percentile value
      String percentile = percentControllers[index].text;

      // Collect selected radio value (Increase/Decrease)
      String selectedValue = selectedValues[index].value;

      // Collect the current `sideWithRepetition` list and serialize each object
      List<Map<String, dynamic>> requiredQuantities = sizeWithTimer
          .map((sizeWithTimer) => sizeWithTimer.toJson())
          .toList();

      // Create an object with the collected data
      Map<String, dynamic> inputObject = {
        "directTimer": {
          "tier1": directTier1,
          "tier2": directTier2,
          "tier3": directTier3,
        },
        "percentile": percentile,
        "adjustment": selectedValue,
        "requiredQuantities": requiredQuantities, // Serialized list
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