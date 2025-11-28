import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Tugas6 extends StatelessWidget {
  const Tugas6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Game FreeToGame',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Tugas6HomePage(title: 'Daftar Game FreeToGame'),
    );
  }
}

class Tugas6HomePage extends StatefulWidget {
  const Tugas6HomePage({super.key, required this.title});
  final String title;

  @override
  State<Tugas6HomePage> createState() => _Tugas6HomePageState();
}

class _Tugas6HomePageState extends State<Tugas6HomePage> {
  List<dynamic> dataGame = [];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  Future<void> _ambilData() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.freetogame.com/api/games'),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          // Hanya ambil 20 data pertama
          dataGame = data.take(20).toList();
        });
      } else {
        throw Exception('Gagal memuat data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Fungsi tombol baca
  Widget _tombolBaca() {
    return ElevatedButton(
      onPressed: () {
        // Aksi ketika tombol ditekan
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: const Text(
        'Baca',
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  // Fungsi list item
  Widget _listItem(String url, String judul, String genre, String rilis) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              url,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error, color: Colors.grey),
                );
              },
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Genre: $genre',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rilis: $rilis',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    _tombolBaca(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: dataGame.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: dataGame.length,
                itemBuilder: (context, index) {
                  final game = dataGame[index];
                  return _listItem(
                    game['thumbnail'] ?? 'https://via.placeholder.com/150',
                    game['title'] ?? 'Tidak ada judul',
                    game['genre'] ?? 'Tidak ada genre',
                    game['release_date'] ?? 'Tidak ada tanggal',
                  );
                },
              ),
      ),
    );
  }
}