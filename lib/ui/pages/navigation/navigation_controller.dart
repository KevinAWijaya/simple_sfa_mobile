import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simple_sfa_mobile/core/base_controller.dart';
import 'package:simple_sfa_mobile/ui/pages/home/home_page.dart';
import 'package:simple_sfa_mobile/ui/pages/page1/page1_page.dart';

class NavigationController extends BaseController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomePage(),
    const Page1(),
    const Page1(),
    const Page1(),
    const Page1(),
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
