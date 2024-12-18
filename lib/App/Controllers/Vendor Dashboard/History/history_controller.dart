import 'package:get/get.dart';

class HistoryController extends GetxController{
  // Navigations
  RxInt selectedIndex = 0.obs;
  RxBool otherScreen = false.obs;

  // filter
  RxBool all = true.obs;
  RxBool completed = false.obs;
  RxBool canceled = false.obs;

  void filterButtons(String selectedButton){
    if(selectedButton == "All"){
      all.value = true;
      completed.value = false;
      canceled.value = false;
    }else if(selectedButton == "Completed"){
      all.value = false;
      completed.value = true;
      canceled.value = false;

    }else if(selectedButton == "Canceled"){
      all.value = false;
      completed.value = false;
      canceled.value = true;

    }
  }

  //check box
  List<RxBool> boolList = List.generate(10, (_) => false.obs);

  void toggleCheckbox(int index, bool? value) {
    if (index >= 0 && index < boolList.length) {
      boolList[index].value = value ?? false;
    }
  }

}