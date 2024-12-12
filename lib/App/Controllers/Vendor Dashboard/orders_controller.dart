import 'package:get/get.dart';

class OrdersController extends GetxController{

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