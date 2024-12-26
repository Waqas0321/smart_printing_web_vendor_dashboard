import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Models/side_with_repetition_model.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/customer_required_quantity_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/operational_quantity_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/side_with_repetition_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/size_withe_timer_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/thickness_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/type_dropdown_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/field_generator_estimator_input_screen.dart';
import '../../../../Models/estimator_items_model.dart';
import '../../../../Models/size_with_timer.dart';
import '../../../../Models/size_with_timer.dart';
import '../../../../Models/thickness_model.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_sizes.dart';

class FieldGeneratorController extends GetxController {
  TextEditingController laminationTypeController = TextEditingController();
  TextEditingController directTier1Controller = TextEditingController();
  TextEditingController directTier2Controller = TextEditingController();
  TextEditingController directTier3Controller = TextEditingController();
  TextEditingController percentController = TextEditingController();
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
  bool _isNumeric(String value) {
    return double.tryParse(value) != null;
  }
  final estimatorPreMadeItems = <EstimatorItem>[
    EstimatorItem(
      title: "TYPE",
      subtitle: " (Dropdown Menu with Timer Per Option)",
    ),
    EstimatorItem(
      title: "THICKNESS",
      subtitle: "(LLevels with Direct Timer + Percentile Increments.)",
    ),
    EstimatorItem(
      title: "Side with Repetition",
      subtitle: "(Number Box with Multiplier and Base Timer)",
    ),
    EstimatorItem(
      title: "Operational Quantity",
      subtitle: "(Number Box with Base Timer)",
    ),
    EstimatorItem(
      title: "Size with Timer",
      subtitle: "(Dimension with Direct Timer)",
    ),
    EstimatorItem(
      title: "Customer Required Quantity",
      subtitle: "(Number Box with Base Timer)",
    ),
  ].obs;
  final estimatorBaseCalculationItems = <EstimatorItem>[
    EstimatorItem(
        title: "Dropdown Menu with Timer Per Option", subtitle: "TYPE"),
    EstimatorItem(
        title: "Levels with Direct Timer + Percentile Increaments",
        subtitle: "THICKNESS"),
    EstimatorItem(
        title: "Number Box with Multiplier with Base Timer",
        subtitle: "Side with Repetition"),
    EstimatorItem(
        title: "Dimension Box with Direct Timer",
        subtitle: "Operational Quantity"),
    EstimatorItem(
        title: "Number Box with Base Timer", subtitle: "Size with Timer"),
    EstimatorItem(
      title: "Customer Required Quantity",
      subtitle: "Customer Required Quantity",
    ),
  ].obs;
  final estimatorInputValuesItems = <EstimatorItem>[
    EstimatorItem(
      title: "Text Box",
    ),
    EstimatorItem(
      title: "Dropdown Box",
    ),
    EstimatorItem(
      title: "Number Box",
    ),
    EstimatorItem(
      title: "Date and Time Box",
    ),
    EstimatorItem(
      title: "Checklist Dropdown Box",
    ),
    EstimatorItem(
      title: "Dimension Box with Direct Timer",
    ),
  ].obs;
  // Add selected item
  void navigateToScreen(String title, BuildContext context) {
    OverlayEntry? overlayEntry;
    if (title == 'TYPE') {
      overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Container(
                color: AppColors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: AppSizes().getWidthPercentage(60),
              child: TypeDropDownScreen(
                  overlayEntry:
                  overlayEntry), // Dynamically use the passed screen
            ),
          ],
        ),
      );

      Navigator.of(context).overlay?.insert(overlayEntry);
    } else if (title == 'THICKNESS') {
      overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Container(
                color: AppColors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: AppSizes().getWidthPercentage(60),
              child: ThicknessScreen(
                  overlayEntry:
                  overlayEntry), // Dynamically use the passed screen
            ),
          ],
        ),
      );
      Navigator.of(context).overlay?.insert(overlayEntry);
    } else if (title == 'Side with Repetition') {
      overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Container(
                color: AppColors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: AppSizes().getWidthPercentage(60),
              child: SideWithRepetitionScreen(
                  overlayEntry:
                  overlayEntry), // Dynamically use the passed screen
            ),
          ],
        ),
      );
      Navigator.of(context).overlay?.insert(overlayEntry);
    } else if (title == 'Operational Quantity') {
      overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Container(
                color: AppColors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: AppSizes().getWidthPercentage(60),
              child: OperationalQuantityScreen(
                  overlayEntry:
                  overlayEntry), // Dynamically use the passed screen
            ),
          ],
        ),
      );
      Navigator.of(context).overlay?.insert(overlayEntry);
    } else if (title == 'Size with Timer') {
      overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Container(
                color: AppColors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: AppSizes().getWidthPercentage(60),
              child: SizeWithTimerScreen(
                  overlayEntry:
                  overlayEntry), // Dynamically use the passed screen
            ),
          ],
        ),
      );
      Navigator.of(context).overlay?.insert(overlayEntry);
    } else if (title == 'Customer Required Quantity') {
      overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            GestureDetector(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Container(
                color: AppColors.black.withOpacity(0.3),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: AppSizes().getWidthPercentage(60),
              child: CustomerRequiredQuantityScreen(
                  overlayEntry:
                  overlayEntry), // Dynamically use the passed screen
            ),
          ],
        ),
      );
      Navigator.of(context).overlay?.insert(overlayEntry);
    }
  }
  RxString increase = "Increase".obs;
  RxString decrease = "Decrease".obs;
  RxString selectedValue = "Increase".obs;
  void openFieldGeneratorEstimatorInputScreen(BuildContext context) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              overlayEntry?.remove();
            },
            child: Container(
              color: AppColors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: AppSizes().getWidthPercentage(60),
            child: FieldGeneratorEstimatorInputValue(
              overlayEntry: overlayEntry,
            ),
          ),
        ],
      ),
    );

    Navigator.of(context).overlay?.insert(overlayEntry);
  }
  void openFieldGeneratorBasicCalculationScreen(BuildContext context) {
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              overlayEntry?.remove();
            },
            child: Container(
              color: AppColors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: AppSizes().getWidthPercentage(60),
            child: TypeDropDownScreen(
              overlayEntry: overlayEntry,
            ),
          ),
        ],
      ),
    );

    Navigator.of(context).overlay?.insert(overlayEntry);
  }

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
      ShowToast().showTopRightToast("Please fill in all the fields before adding!");
    }
  }
  void removeThickness(int index) {
    thickness.removeAt(index);
  }

  // Operational Quanitity
  TextEditingController operationalQuantityController = TextEditingController();
  RxList<String> operationalQuantity = <String>[].obs;
  void addOperationalQuantity() {
    if (operationalQuantityController.text.trim().isNotEmpty) {
      if (_isNumeric(operationalQuantityController.text.trim())) {
        operationalQuantity.add(operationalQuantityController.text.trim());
        operationalQuantityController.clear();
      } else {
        ShowToast().showTopRightToast("Please enter a valid numeric value!");
      }
    } else {
      ShowToast().showTopRightToast("Please fill in the field before adding!");
    }
  }
  void removeOperationalQuantity(int index) {
    operationalQuantity.removeAt(index);
  }

  // Customer Required Quantity
  TextEditingController cRequiredQuantityController = TextEditingController();
  RxList<String> cRequiredQuantity = <String>[].obs;
  void addCRequiredQuantity() {
    if (cRequiredQuantityController.text.trim().isNotEmpty) {
      if (_isNumeric(cRequiredQuantityController.text.trim())) {
        cRequiredQuantity.add(cRequiredQuantityController.text.trim());
        cRequiredQuantityController.clear();
      } else {
        ShowToast().showTopRightToast("Please enter a valid numeric value!");
      }
    } else {
      ShowToast().showTopRightToast("Please fill in the field before adding!");
    }
  }
  void removeCRequiredQuantity(int index) {
    cRequiredQuantity.removeAt(index);
  }

  // Size With Base Timer
  TextEditingController sBTLengthController = TextEditingController();
  TextEditingController sBTWidthController = TextEditingController();
  TextEditingController sBTHeightController = TextEditingController();
  RxString inch = "INCH".obs;
  RxString cm = "CM".obs;
  RxString selectedMeasurement = "CM".obs;
  RxList<SizeWithTimer> sizeWithTimer = <SizeWithTimer>[].obs;
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
      ShowToast().showTopRightToast(
          "Please enter valid numeric values in all fields before adding!");
    }
  }
  void removeSideWithRepetition(int index) {
    sideWithRepetition.removeAt(index);
  }



}

