import 'package:flutter/material.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/Settings/processes_controller.dart';
import 'package:get/get.dart';

class ProcessesScreen extends StatelessWidget {
  const ProcessesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProcessesController processesController = Get.put(ProcessesController());
    return const Center(
      child: Text(
        "Processes Screen",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
