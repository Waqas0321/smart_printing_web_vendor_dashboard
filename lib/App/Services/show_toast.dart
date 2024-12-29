import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';

class ShowToast {
  void showTopToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: AppColors.white,
      textColor: AppColors.primary,
      fontSize: 16.0,
      webPosition: "center",
      timeInSecForIosWeb: 2,
      webBgColor: "white",
    );
  }
}
