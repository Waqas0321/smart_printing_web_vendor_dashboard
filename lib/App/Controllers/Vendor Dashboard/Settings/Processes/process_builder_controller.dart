import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProcessBuilderController extends GetxController{
  TextEditingController lengthController = TextEditingController();
  RxBool isExpanded = false.obs;

  var selectedType1 = "Type 1".obs;
  var selectedType2 = "Type 1".obs;

  void expandedFunction() {
    isExpanded.value = !isExpanded.value;
  }

}