import 'package:flutter/material.dart';

class Praktikum9 extends StatefulWidget {
  const Praktikum9({super.key});

  @override
  State<Praktikum9> createState() => _Praktikum9State();
}

class _Praktikum9State extends State<Praktikum9> {
  @override
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Like Button")),
      body: Center(
        child: Column(
          children: [
            Text("Klik Tombol Tambah atau Kurang", style: TextStyle(fontSize: 24)),
            Text('$_counter', style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                  onPressed: _decrementCounter,
                  child: Text("Kurang", style: TextStyle(fontSize: 24, color: Colors.white)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade700, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                  onPressed: _incrementCounter,
                  child: Text("Tambah", style: TextStyle(fontSize: 24, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
