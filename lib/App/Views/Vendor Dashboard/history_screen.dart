import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/history_controller.dart';
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HistoryController historyController = Get.put(HistoryController());
    return Center(child: Text("History Screen", style: TextStyle(fontSize: 24)));
  }
}