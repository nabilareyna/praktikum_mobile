import 'package:flutter/material.dart';

class Praktikum4 extends StatelessWidget {
  const Praktikum4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flexible'),
      ),
      body: Column(
        children: [
          _kotakUji(Colors.amber, 150, 'normal'),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: _kotakUji(Colors.green, 150, 'flexible'),
          ),
          Expanded(
            flex: 2,
            child: _kotakUji(Colors.blue, 250, 'expanded')),
        ],
      )
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

Container _kotakUji(Color warna, double tinggi, String text){
  return Container(
    width: double.infinity,
    height: tinggi,
    color: warna,
    alignment: const Alignment(0, 0),
    child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 30)),
  );
}