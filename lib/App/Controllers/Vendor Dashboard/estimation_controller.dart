import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EstimationController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
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