import 'package:flutter/material.dart';

class Praktikum5 extends StatelessWidget {
  const Praktikum5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contoh Sized Box')),
      body: Center(
        child: Column(
          children: [
            Text("sizedbox"),
            Row(
              children: [
                kotakUji(Colors.amber),
                SizedBox(width: 25, height: 25),
                SizedBox(width: 100, height: 100, child: kotakUji(Colors.green)),
                SizedBox(width: 25, height: 25),
                kotakUji(Colors.blue),
                SizedBox(width: 25, height: 25, child: kotakUji(Colors.black)),
              ],
            ),
            Text("spacer"),
            Row(
              children: [
                kotakUji(Colors.amber),
                Spacer(flex: 1),
                kotakUji(Colors.green),
                Spacer(flex: 2),
                kotakUji(Colors.blue),
                Spacer(),
                kotakUji(Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Container kotakUji(Color warna) {
  return Container(width: 75, height: 75, color: warna);
}
