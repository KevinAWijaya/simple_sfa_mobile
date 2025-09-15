import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sfa_mobile/core/constants.dart';
import 'package:simple_sfa_mobile/core/theme/color.dart';
import 'package:simple_sfa_mobile/ui/pages/navigation/navigation_controller.dart';
import 'package:simple_sfa_mobile/ui/widgets/loading_page.dart';
import 'package:simple_sfa_mobile/ui/widgets/text.dart';

class NavigationPage extends GetView<NavigationController> {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoadingObs.value ? const VLoadingPage() : controller.pages[controller.selectedIndex.value]),
      backgroundColor: VColor.background,
      bottomNavigationBar: Obx(
        () => BottomAppBar(
          color: VColor.white,
          shape: const CircularNotchedRectangle(),
          height: 80,
          notchMargin: 0.0,
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              Expanded(child: _buildNavItem(Icons.home, "Home", 0)),
              Expanded(child: _buildNavItem(Icons.people, "Outlet", 1)),
              Expanded(child: _buildNavItem(Icons.receipt, "Schedule", 3)),
              Expanded(child: _buildNavItem(Icons.settings, "Pengaturan", 4)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isActive = controller.selectedIndex.value == index;

    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () => controller.changePage(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isActive ? VColor.primary : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isActive ? VColor.white : VColor.grey3,
              ),
            ),
            const SizedBox(height: 4),
            VText(
              label,
              fontSize: textSizeSmall,
              color: isActive ? VColor.primary : VColor.grey3,
              isBold: true,
            )
          ],
        ),
      ),
    );
  }
}
