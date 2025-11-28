import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praktikum_mobile_1/modules/modul_10/view/home_10.dart';
import 'package:praktikum_mobile_1/modules/modul_10/view/detail.dart';

class Praktikum10 extends StatelessWidget {
  const Praktikum10({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Game Store",
      home: Home10(),
      initialRoute: '/',
      routes: {
        
        '/detail': (context) {
          final gameId = ModalRoute.of(context)!.settings.arguments as int;
          return Detail(gameTerpilih: gameId);
        },
      },
    );
  }
}
