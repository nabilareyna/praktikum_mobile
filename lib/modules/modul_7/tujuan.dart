// import 'package:flutter/material.dart';

// class Tujuan extends StatelessWidget {
//   const Tujuan({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Halaman Tujuan')),
//       body: Center(
//         child: Column(
//           children: [
//             Text("Ini adalah halaman tujuan", style: TextStyle(fontSize: 20)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, side: BorderSide(width: 1.0, color: Colors.blue)),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text("Kembali ke home", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class HalamanTujuan extends StatelessWidget {
  const HalamanTujuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(title: Text("Ini Halaman Tujuan"), centerTitle: true),
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
            Image.asset("assets/icon/island.png", height: 150),
            Text(
              "Pertama, kita perlu membuat dua halaman atau 'routes' yang ingin kita tampilkan. "
              "Selanjutnya, kita gunakan Navigator.pushNamed() untuk berpindah dari halaman pertama ke halaman kedua. "
              "Ini seperti kita membuka halaman baru. Terakhir, kita bisa kembali dari halaman kedua ke halaman pertama menggunakan Navigator.pop(). "
              "Seperti menutup halaman kedua dan kembali ke halaman pertama.",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text("Ke halaman home >", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
