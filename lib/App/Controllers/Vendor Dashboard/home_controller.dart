import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/help_center_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/setting_screen.dart';
import '../../Views/Vendor Dashboard/estimation_screen.dart';
import '../../Views/Vendor Dashboard/history_screen.dart';
import '../../Views/Vendor Dashboard/orders_screen.dart';
import '../../Views/Vendor Dashboard/overview_screen.dart';

class HomeController extends GetxController{
  var selectedIndex = 0.obs;
  TextEditingController searchController = TextEditingController();

  final List<Widget> screens = [
    OverviewScreen(),
    EstimationScreen(),
    OrdersScreen(),
    HistoryScreen(),
    SettingsScreen(),
    HelpCenterScreen()
  ];

  void onSidebarItemTap(int index) {
    selectedIndex.value = index;
  }

}