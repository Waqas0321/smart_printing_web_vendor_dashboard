import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/settings_controller.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
@override
  Widget build(BuildContext context) {
  SettingsController settingsController = Get.put(SettingsController());
    return Center(child: Text("Settings Screen", style: TextStyle(fontSize: 24)));
  }
}
