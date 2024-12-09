import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Controllers/Vendor%20Dashboard/orders_controller.dart';
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersController ordersController = Get.put(OrdersController());
    return Center(child: Text("Orders Screen", style: TextStyle(fontSize: 24)));
  }
}