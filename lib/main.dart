import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_sfa_mobile/core/route/app_pages.dart';
import 'package:simple_sfa_mobile/core/services/api_client.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() => ApiClient().init());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
