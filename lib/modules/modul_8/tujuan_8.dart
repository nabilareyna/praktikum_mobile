import 'package:flutter/material.dart';
import 'package:praktikum_mobile_1/modules/modul_8/screen_argument.dart';

class Tujuan8 extends StatelessWidget {
  const Tujuan8({super.key});

  static const routeName = '/tujuan';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArgument;
    return Scaffold(
      appBar: AppBar(title: Text("Halaman Tujuan")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(args.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(args.subtitle, style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
            SizedBox(height: 20),
            Text(args.description, style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Kembali ke Halaman Home"),
            ),
          ],
        ),
      ),
    );
  }
}
