import 'package:get/get.dart';
import 'package:simple_sfa_mobile/ui/pages/home/home_detail/home_detail_controller.dart';

class HomeDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeDetailController>(HomeDetailController());
  }
}
