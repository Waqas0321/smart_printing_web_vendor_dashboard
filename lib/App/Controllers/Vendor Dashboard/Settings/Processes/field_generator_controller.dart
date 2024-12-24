import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/field_generator_basic_calculation_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/field_generator_estimator_input_screen.dart';
import '../../../../Models/estimator_items_model.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_sizes.dart';

class FieldGeneratorController extends GetxController {
  TextEditingController laminationTypeController = TextEditingController();
  TextEditingController directTier1Controller = TextEditingController();
  TextEditingController directTier2Controller = TextEditingController();
  TextEditingController directTier3Controller = TextEditingController();
  TextEditingController percentController = TextEditingController();
  final estimatorPreMadeItems = <EstimatorItem>[
    EstimatorItem(
      title: "Estimator Input Value",
      subtitle: "(Levels with Timer 10 + Increment 5%)",
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
      title: "Dropdown Menu with Timer Per Option",
    ),
    EstimatorItem(
      title: "Levels with Direct Timer + Percentile Increaments",
    ),
    EstimatorItem(
      title: "Number Box with Multiplier with Base Timer",
    ),
    EstimatorItem(
      title: "Dimension Box with Direct Timer",
    ),
    EstimatorItem(
      title: "Number Box with Base Timer",
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

  // Selected items
  final preMadeValues = <String>[].obs;
  final baseCalculation = <String>[].obs;
  final inputValues = <String>[].obs;

  // Add selected item
  void addSelectedPreMadeItem(String item) {
    preMadeValues.add(item);
    print("Selected Items: $preMadeValues");
  }

  void addSelectedBaseCalculationItem(String item) {
    baseCalculation.add(item);
    print("Selected Items: $baseCalculation");
  }
  void addSelectedInputValuesItem(String item) {
    inputValues.add(item);
    print("Selected Items: $inputValues");
  }

  RxString increase = "Increase".obs;
  RxString decrease = "Decrease".obs;
  RxString selectedValue = "Increase".obs;

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
            child: FieldGeneratorBasicCalculationScreen(
              overlayEntry: overlayEntry,
            ),
          ),
        ],
      ),
    );

    Navigator.of(context).overlay?.insert(overlayEntry);
  }
}
