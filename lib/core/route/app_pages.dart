import 'package:get/get.dart';
import 'package:simple_sfa_mobile/ui/pages/home/home_detail/home_detail_binding.dart';
import 'package:simple_sfa_mobile/ui/pages/home/home_detail/home_detail_page.dart';
import 'package:simple_sfa_mobile/ui/pages/home/home_page.dart';
import 'package:simple_sfa_mobile/ui/pages/navigation/navigation_binding.dart';
import 'package:simple_sfa_mobile/ui/pages/navigation/navigation_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const initial = RoutesPath.navigatorPage;
  static const navigatorPage = RoutesPath.navigatorPage;
  static const homePage = RoutesPath.homePage;

  static final routes = [
    GetPage(
      name: RoutesPath.navigatorPage,
      page: () => const NavigationPage(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: RoutesPath.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RoutesPath.homeDetailPage,
      page: () => const HomeDetailPage(),
      binding: HomeDetailBinding(),
    ),
  ];
}
