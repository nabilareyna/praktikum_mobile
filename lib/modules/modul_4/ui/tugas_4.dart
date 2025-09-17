import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemutar Musik',
      theme: ThemeData.dark(), // 🔥 background gelap
      home: const MusicPlayerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemutar Musik'),
        backgroundColor: Colors.black54, // 🔥 app bar gelap
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/home');
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Pemutar Musik',
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        color: Colors.black54, // 🔥 control bar gelap
        child: Row(
          children: [
            // Shuffle
            const Expanded(
              child: Icon(Icons.shuffle, color: Colors.white),
            ),
            // Previous
            const Expanded(
              child: Icon(Icons.skip_previous, color: Colors.white),
            ),
            // Play (lebih besar pakai Flexible flex:2)
            const Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Icon(Icons.play_circle_fill,
                  color: Colors.white, size: 48), // lebih besar
            ),
            // Next
            const Expanded(
              child: Icon(Icons.skip_next, color: Colors.white),
            ),
            // Repeat
            const Expanded(
              child: Icon(Icons.repeat, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}