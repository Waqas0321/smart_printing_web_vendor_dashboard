import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/Vendor Dashboard/home_controller.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold();
  }
}
