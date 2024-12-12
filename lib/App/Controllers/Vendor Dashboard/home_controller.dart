import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Estimation/estimation_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/History/history_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Orders/orders_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/help_center_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/setting_main_screen.dart';
import '../../Views/Vendor Dashboard/Estimation/estimation_screen.dart';
import '../../Views/Vendor Dashboard/History/history_screen.dart';
import '../../Views/Vendor Dashboard/orders_screen.dart';
import '../../Views/Vendor Dashboard/overview_screen.dart';

class HomeController extends GetxController{
  var selectedIndex = 0.obs;
  TextEditingController searchController = TextEditingController();

  final List<Widget> screens = [
    OverviewScreen(),
    EstimationMainScreen(),
    OrdersMainScreen(),
    HistoryMainScreen(),
    SettingsMainScreen(),
    HelpCenterScreen()
  ];

  void onSidebarItemTap(int index) {
    selectedIndex.value = index;
  }

}