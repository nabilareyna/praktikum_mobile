// import 'package:flutter/material.dart';
// import 'package:praktikum_mobile_1/modules/modul_7/tujuan.dart';

// class HomeDemoRoute extends StatelessWidget {
//   const HomeDemoRoute({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       debugShowCheckedModeBanner: false,
//       routes: {'/': (context) => const MyHomeDemoRoute(), '/tujuan': (context) => const Tujuan()},
//     );
//   }
// }

// class MyHomeDemoRoute extends StatelessWidget {
//   const MyHomeDemoRoute({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home Demo Route')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Ini adalah halaman home", style: TextStyle(fontSize: 20)),
//             SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, side: BorderSide(width: 1.0, color: Colors.blue)),
//               onPressed: () {
//                 Navigator.pushNamed(context, "/tujuan");
//               },
//               child: Text("Ke halaman tujuan", style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
