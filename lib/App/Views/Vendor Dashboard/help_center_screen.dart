import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/help_center_controller.dart';
class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HelpCenterController helpCenterController = Get.put(HelpCenterController());
    return Center(child: Text("Help Center", style: TextStyle(fontSize: 24)));
  }
}
