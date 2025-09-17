import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Praktikum Mobile')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Get.toNamed('/tugas_1'),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10)),
                child: const Text('Tugas Modul 1', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/praktikum_2'),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10)),
                child: const Text('Praktikum Modul 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/tugas_2'),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10)),
                child: const Text('Tugas Modul 2', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/praktikum_3'),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10)),
                child: const Text('Praktikum Modul 3', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/tugas_3'),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10)),
                child: const Text('Tugas Modul 3', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/praktikum_4'),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10)),
                child: const Text('Praktikum Modul 4', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/tugas_4'),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10)),
                child: const Text('Tugas Modul 4', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/praktikum_5'),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10)),
                child: const Text('Praktikum Modul 5', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            InkWell(
              onTap: () => Get.toNamed('/praktikum_5_card'),
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue.shade200, borderRadius: BorderRadius.circular(10)),
                child: const Text('Praktikum Modul 5 Card', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
