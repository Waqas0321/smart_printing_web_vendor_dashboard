import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../Models/side_with_repetition_model.dart';
import '../../../../Services/show_toast.dart';

class SideWithRepetitionController extends GetxController{
  List<TextEditingController> directTier1Controllers = [];
  List<TextEditingController> directTier2Controllers = [];
  List<TextEditingController> directTier3Controllers = [];
  List<TextEditingController> percentControllers = [];
  // Side with Repetition
  TextEditingController sidesController = TextEditingController();
  TextEditingController repetitionSideOneController = TextEditingController();
  TextEditingController repetitionMultiplierController = TextEditingController();
  RxList<SideWithRepetitionModel> sideWithRepetition = <SideWithRepetitionModel>[].obs;
  void addSideWithRepetition() {
    // Check if all controllers have valid numeric values
    if (sidesController.text.trim().isNotEmpty &&
        repetitionSideOneController.text.trim().isNotEmpty &&
        repetitionMultiplierController.text.trim().isNotEmpty &&
        _isNumeric(sidesController.text.trim()) &&
        _isNumeric(repetitionSideOneController.text.trim()) &&
        _isNumeric(repetitionMultiplierController.text.trim())) {
      // Add a new SizeWithTimer object to the list
      sideWithRepetition.add(
        SideWithRepetitionModel(
          sides: double.parse(sidesController.text.trim()),
          repetitionOnSide1: double.parse(repetitionSideOneController.text.trim()),
          repetitionMultiplier: double.parse(repetitionMultiplierController.text.trim()),

        ),
      );
      // Clear the controllers after adding to the list
      sidesController.clear();
      repetitionSideOneController.clear();
      repetitionMultiplierController.clear();
    } else {
      ShowToast().showTopToast(
          "Please enter valid numeric values in all fields before adding!");
    }
  }
  void removeSideWithRepetition(int index) {
    sideWithRepetition.removeAt(index);
  }

  var selectedValues = <RxString>[].obs;
  @override
  void onInit() {
    super.onInit();
    initializeControllers(sideWithRepetition.length);
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
    for (int index = 0; index < sideWithRepetition.length; index++) {
      String directTier1 = directTier1Controllers[index].text;
      String directTier2 = directTier2Controllers[index].text;
      String directTier3 = directTier3Controllers[index].text;

      // Collect percentile value
      String percentile = percentControllers[index].text;

      // Collect selected radio value (Increase/Decrease)
      String selectedValue = selectedValues[index].value;

      // Collect the current `sideWithRepetition` list and serialize each object
      List<Map<String, dynamic>> requiredQuantities = sideWithRepetition
          .map((sideWithRepetitionModel) => sideWithRepetitionModel.toJson())
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
  bool _isNumeric(String value) {
    return double.tryParse(value) != null;
  }
}