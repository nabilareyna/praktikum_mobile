import 'package:flutter/material.dart';
import 'package:praktikum_mobile_1/modules/modul_7/tujuan.dart';

class Tugas7 extends StatelessWidget {
  const Tugas7({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Navigasi Flutter",
      theme: ThemeData(primarySwatch: Colors.blue),
      // Halaman pertama
      // initialRoute: '/',
      // // Daftar route
      // routes: {
      //   '/': (context) => HalamanHome(),
      //   '/tujuan': (context) => HalamanTujuan(),
      // },
    );
  }
}

class HalamanHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Ini Halaman Home"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Banyak aplikasi memiliki beberapa layar untuk menampilkan informasi yang berbeda. "
              "Contohnya, ada layar produk, dan ketika pengguna mengklik produk, akan muncul layar detail produk tersebut.",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            Image.asset("assets/icon/house.png", height: 150),
            Text(
              "Pertama, kita perlu membuat dua halaman atau 'routes' yang ingin kita tampilkan. "
              "Selanjutnya, kita gunakan Navigator.pushNamed() untuk berpindah dari halaman pertama ke halaman kedua. "
              "Ini seperti kita membuka halaman baru. Terakhir, kita bisa kembali dari halaman kedua ke halaman pertama menggunakan Navigator.pop(). "
              "Seperti menutup halaman kedua dan kembali ke halaman pertama.",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pushNamed(context, '/tujuan');
              },
              child: Text("Ke halaman tujuan >"),
            ),
          ],
        ),
      ),
    );
  }
}
