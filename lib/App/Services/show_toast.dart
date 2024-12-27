import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_printing_web/App/Utils/Const/appColors.dart';

class ShowToast {
  void showTopRightToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: AppColors.white,
      textColor: AppColors.primary,
      fontSize: 16.0,
      webPosition: "right",
      timeInSecForIosWeb: 2,
      webBgColor: "white",
    );
  }
}
