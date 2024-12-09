import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/estimation_controller.dart';
class EstimationScreen extends StatelessWidget {
 const EstimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EstimationController estimationController = Get.put(EstimationController());
    return Center(child: Text("Estimation Screen", style: TextStyle(fontSize: 24)));
  }
}