import 'package:flutter/material.dart';

class Praktikum3 extends StatelessWidget {
  const Praktikum3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aligntment")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text("Suhu", style: TextStyle(fontSize: 30)),
            Text("25\u00B0C", style: TextStyle(fontSize: 30)),
            Icon(Icons.wb_sunny, size: 45, color: Colors.amber),
          ],
        ),
      ),
    );
  }
}

class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(12)),
      child: Icon(Icons.thumb_up, color: Colors.white, size: 40),
    );
  }
}

class KotakBiruJempolKecil extends StatelessWidget {
  const KotakBiruJempolKecil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(color: Colors.blue, border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(12)),
      child: Icon(Icons.thumb_up, color: Colors.white, size: 40),
    );
  }
}
