import 'package:get/get.dart';
import 'package:simple_sfa_mobile/core/services/api_client.dart';
import 'package:simple_sfa_mobile/data/repositories/customer_repo.dart';
import 'package:simple_sfa_mobile/ui/pages/home/home_controller.dart';
import 'package:simple_sfa_mobile/ui/pages/navigation/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerRepo>(() => CustomerRepo(Get.find<ApiClient>()));

    Get.lazyPut<NavigationController>(() => NavigationController());

    Get.lazyPut<HomeController>(() => HomeController(Get.find<CustomerRepo>()));
  }
}
