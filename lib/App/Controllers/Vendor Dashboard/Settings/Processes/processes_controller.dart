import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/process_builder_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/Processes/processes_Screen.dart';

class ProcessesController extends GetxController{
  //check box
  List<RxBool> boolList = List.generate(10, (_) => false.obs);

  void toggleCheckbox(int index, bool? value) {
    if (index >= 0 && index < boolList.length) {
      boolList[index].value = value ?? false;
    }
  }
  RxInt selectedIndexProcesses = 0.obs;
  final List<Widget> screens = [
    ProcessesScreen(),
    ProcessBuilderScreen(),
  ].obs;

}