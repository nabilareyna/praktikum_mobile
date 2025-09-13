
import 'package:get/get.dart';
import 'package:praktikum_mobile_1/modules/home.dart';
import 'package:praktikum_mobile_1/modules/modul_1/ui/tugas_1.dart';
import 'package:praktikum_mobile_1/modules/modul_2/ui/praktikum_2.dart';
import 'package:praktikum_mobile_1/modules/modul_2/ui/tugas_2.dart';
import 'package:praktikum_mobile_1/modules/modul_3/ui/praktikum_3.dart';
import 'package:praktikum_mobile_1/modules/modul_3/ui/tugas_3.dart';
import 'package:praktikum_mobile_1/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const Home()),
    GetPage(name: AppRoutes.tugas_1, page: () => const Tugas1()),
    GetPage(name: AppRoutes.praktikum_2, page: () => const Praktikum2()),
    GetPage(name: AppRoutes.tugas_2, page: () => Tugas2()),
    GetPage(name: AppRoutes.praktikum_3, page: () => const Praktikum3()),
    GetPage(name: AppRoutes.tugas_3, page: () => Tugas3()),
  ];
}