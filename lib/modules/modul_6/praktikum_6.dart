import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Praktikum6 extends StatelessWidget {
  const Praktikum6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo GridView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo Gridview'),
          backgroundColor: Colors.amber,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.toNamed('/home');
            },
          ),
        ),
        body: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          children: [
            tile(Colors.blue.shade200, 'assets/icon/boy.png', 'Kehadiran'),
            tile(Colors.greenAccent.shade400, 'assets/icon/timetable.png', 'Jadwal Kuliah'),
            tile(Colors.yellowAccent.shade400, 'assets/icon/homeschooling.png', 'Tugas'),
            tile(Colors.redAccent.shade400, 'assets/icon/clipboard.png', 'Pengumuman'),
            tile(Colors.purpleAccent.shade400, 'assets/icon/marks.png', 'Nilai'),
            tile(Colors.tealAccent.shade400, 'assets/icon/pencil.png', 'Catatan'),
          ],
        ),
      ),
    );
  }
}

ClipRRect tile(Color warnaKotak, String gambar, String judul) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      color: warnaKotak,
      child: GridTile(
        footer: SizedBox(
          height: 45,
          child: GridTileBar(backgroundColor: Colors.black38, title: Text(judul, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ),
        child: Image.asset(gambar, scale: 4),
      ),
    ),
  );
}
