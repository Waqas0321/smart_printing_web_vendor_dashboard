import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Services/show_toast.dart';
import 'package:smart_printing_web/App/Widgets/custom_text_widget.dart';

class OpenCalendarService extends GetxController {
  var selectedDate = Rx<DateTime>(DateTime.now());

  Future<void> openCalendarDialog(BuildContext context) async {
    DateTime? pickedDate = await showDialog<DateTime>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: CustomTextWidget(
            text: "Pick a date",
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          content: SizedBox(
            height: 300,
            width: 300,
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              onDateChanged: (selectedDate) {
                Navigator.of(context).pop(selectedDate);
              },
            ),
          ),
        );
      },
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      String formattedMessage = "Selected Date: $formattedDate";
      ShowToast().showTopRightToast(formattedMessage);
    }
  }
}
