import 'package:get/get.dart';
import 'package:praktikum_mobile_1/modules/home.dart';
import 'package:praktikum_mobile_1/modules/modul_1/ui/tugas_1.dart';
import 'package:praktikum_mobile_1/modules/modul_10/praktikum_10.dart';
import 'package:praktikum_mobile_1/modules/modul_11/controller/c_tasbih_page.dart';
import 'package:praktikum_mobile_1/modules/modul_11/ui/tasbihPage.dart';
import 'package:praktikum_mobile_1/modules/modul_12/ui/ui_mainpage_location.dart';
import 'package:praktikum_mobile_1/modules/modul_13/ui/ui_mainpage.dart';
import 'package:praktikum_mobile_1/modules/modul_2/ui/praktikum_2.dart';
import 'package:praktikum_mobile_1/modules/modul_2/ui/tugas_2.dart';
import 'package:praktikum_mobile_1/modules/modul_3/ui/praktikum_3.dart';
import 'package:praktikum_mobile_1/modules/modul_3/ui/tugas_3.dart';
import 'package:praktikum_mobile_1/modules/modul_4/ui/praktikum_4.dart';
import 'package:praktikum_mobile_1/modules/modul_4/ui/tugas_4.dart';
import 'package:praktikum_mobile_1/modules/modul_5/ui/praktikum_5.dart';
import 'package:praktikum_mobile_1/modules/modul_5/ui/praktikum_5_card.dart';
import 'package:praktikum_mobile_1/modules/modul_5/ui/tugas_5.dart';
import 'package:praktikum_mobile_1/modules/modul_6/demo_grid_view_builder.dart';
import 'package:praktikum_mobile_1/modules/modul_6/demo_list_view_builder.dart';
import 'package:praktikum_mobile_1/modules/modul_6/demo_listview.dart';
import 'package:praktikum_mobile_1/modules/modul_6/praktikum_6.dart';
import 'package:praktikum_mobile_1/modules/modul_6/tugas_6.dart';
import 'package:praktikum_mobile_1/modules/modul_7/home_demo_route.dart';
import 'package:praktikum_mobile_1/modules/modul_7/tugas_7.dart';
import 'package:praktikum_mobile_1/modules/modul_8/home_8.dart';
import 'package:praktikum_mobile_1/modules/modul_9/praktikum_9.dart';
import 'package:praktikum_mobile_1/modules/modul_9/tugas_9.dart';
import 'package:praktikum_mobile_1/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => const Home()),
    GetPage(name: AppRoutes.tugas_1, page: () => const Tugas1()),
    GetPage(name: AppRoutes.praktikum_2, page: () => const Praktikum2()),
    GetPage(name: AppRoutes.tugas_2, page: () => Tugas2()),
    GetPage(name: AppRoutes.praktikum_3, page: () => const Praktikum3()),
    GetPage(name: AppRoutes.tugas_3, page: () => Tugas3()),
    GetPage(name: AppRoutes.praktikum_4, page: () => Praktikum4()),
    GetPage(name: AppRoutes.tugas_4, page: () => Tugas4()),
    GetPage(name: AppRoutes.praktikum_5, page: () => Praktikum5()),
    GetPage(name: AppRoutes.praktikum5Card, page: () => Praktikum5Card()),
    GetPage(name: AppRoutes.tugas_5, page: () => Tugas5()),
    GetPage(name: AppRoutes.praktikum_6, page: () => Praktikum6()),
    GetPage(name: AppRoutes.demoListView, page: () => DemoListview()),
    GetPage(name: AppRoutes.demoGridViewBuilder, page: () => MyHomePage(title: "Demo Grid View")),
    GetPage(name: AppRoutes.demoListViewBuilder, page: () => DemoListViewBuilder(title: "Demo List View Builder")),
    GetPage(name: AppRoutes.tugas_6, page: () => const Tugas6()),
    // GetPage(name: AppRoutes.praktikum_7, page: () => const HomeDemoRoute()),
    GetPage(name: AppRoutes.tugas_7, page: () => const Tugas7()),
    GetPage(name: AppRoutes.praktikum_8, page: () => const Home8()),
    GetPage(name: AppRoutes.praktikum_9, page: () => const Praktikum9()),
    GetPage(name: AppRoutes.tugas_9, page: () => Tugas9()),
    GetPage(name: AppRoutes.praktikum_10, page: () => Praktikum10()),
    GetPage(
      name: AppRoutes.praktikum_11,
      page: () => const Tasbihpage(),
      binding: BindingsBuilder(() {
        Get.put(CTasbihPage());
      }),
    ),
    GetPage(name: AppRoutes.praktikum_12, page: () => UiMainpageLocation()),
    GetPage(name: AppRoutes.praktikum_13, page: () => UiMainpage()),
  ];
}
