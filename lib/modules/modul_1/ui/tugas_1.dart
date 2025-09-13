import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Program Pertamaku')),
      body: Center(child: Text('Hello, World!', style: TextStyle(fontSize: 24))));
  }
}
