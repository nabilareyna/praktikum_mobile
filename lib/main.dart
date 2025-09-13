import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum_mobile_1/routes/app_pages.dart';
import 'package:praktikum_mobile_1/routes/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum Mobile',
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}
