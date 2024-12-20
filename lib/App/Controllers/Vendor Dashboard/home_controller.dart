import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Estimation/estimation_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/History/history_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Orders/orders_main_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Help%20Center/help_center_screen.dart';
import 'package:smart_printing_web/App/Views/Vendor%20Dashboard/Setting/setting_main_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Views/Vendor Dashboard/Estimation/estimation_screen.dart';
import '../../Views/Vendor Dashboard/History/history_screen.dart';
import '../../Views/Vendor Dashboard/Orders/orders_screen.dart';
import '../../Views/Vendor Dashboard/OverView/overview_screen.dart';

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
  void openWhatsAppChat(String number) async {
    final url = "https://wa.me/$number";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      print("Could not launch $url");
    }
  }

}