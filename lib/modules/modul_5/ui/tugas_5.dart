import 'package:flutter/material.dart';

class Tugas5 extends StatelessWidget {
  const Tugas5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData.dark(), // tampilan gelap
      home: NowPlayingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NowPlayingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sedang memutar"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.album, size: 100, color: Colors.blueGrey[200]),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Di sini ada judul lagu", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Align(alignment: Alignment.centerRight, child: Icon(Icons.favorite_border, color: Colors.redAccent)),
                        ],
                      ),
                      Text("Di sini ada nama artis", style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
