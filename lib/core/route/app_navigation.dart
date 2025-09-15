import 'package:get/get.dart';

import 'app_pages.dart';

class VNavigation {
  static void toHomeDetail() {
    Get.offAllNamed(
      RoutesPath.homeDetailPage,
    );
  }
}
