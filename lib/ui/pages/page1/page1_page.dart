import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sfa_mobile/ui/pages/navigation/navigation_controller.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

class Page1 extends GetView<NavigationController> {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: VText("This page is not implemented yet"),
      )),
    );
  }
}
