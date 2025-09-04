import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("Program pertamaku")), body: Center(child: Text('Nabila Reyna Rahmadhani', style: TextStyle(fontSize: 24)))),
    );
  }
}
