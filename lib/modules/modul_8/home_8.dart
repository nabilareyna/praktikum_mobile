import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praktikum_mobile_1/modules/modul_8/screen_argument.dart';
import 'package:praktikum_mobile_1/modules/modul_8/tujuan_8.dart';

class Home8 extends StatelessWidget {
  const Home8({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {'/': (context) => const MyHome8(), Tujuan8.routeName: (context) => const Tujuan8()},
    );
  }
}

class MyHome8 extends StatelessWidget {
  const MyHome8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Home"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/home');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Ini Halaman Home", style: TextStyle(fontSize: 24)),
            SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                final args = ScreenArgument(title: 'Judul Game', subtitle: 'Genre: Action', description: 'ini adalah deskripsi dari game.');
                Navigator.pushNamed(context, Tujuan8.routeName, arguments: args);
              },
              child: Text("Ke Halaman Tujuan"),
            ),
          ],
        ),
      ),
    );
  }
}
