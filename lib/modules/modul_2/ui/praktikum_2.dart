import 'package:flutter/material.dart';

class Praktikum2 extends StatelessWidget {
  const Praktikum2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row and Column"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KotakBiruJempol(),
            SizedBox(height: 20,),
            KotakBiruJempol(),
            SizedBox(height: 20,),
            KotakBiruJempol()
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