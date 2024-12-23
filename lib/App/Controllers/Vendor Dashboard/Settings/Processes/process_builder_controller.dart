import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../Utils/Const/appColors.dart';
import '../../../../Utils/Const/app_sizes.dart';
import '../../../../Views/Vendor Dashboard/Setting/Processes/field_generator_screen.dart';

class ProcessBuilderController extends GetxController{

  void openFieldGeneratorScreen(BuildContext context) {
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
            width: AppSizes().getWidthPercentage(75),
            child: FieldGeneratorScreen(overlayEntry: overlayEntry,),
          ),
        ],
      ),
    );

    Navigator.of(context).overlay?.insert(overlayEntry);
  }

}