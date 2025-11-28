import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List dataBerita = [];
  String? errorMessage; // ✅ simpan pesan error

  Future<void> _ambilData() async {
    setState(() {
      errorMessage = null; // reset error setiap fetch
    });
    try {
      final response = await http.get(
        Uri.parse('https://jakpost.vercel.app/api/category/business/tech'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          dataBerita = data['posts'];
        });
      } else {
        setState(() {
          errorMessage = 'Gagal mengambil data: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: errorMessage != null
            ? Center(
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              )
            : dataBerita.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.25,
                    ),
                    itemCount: dataBerita.length,
                    itemBuilder: (context, index) {
                      final berita = dataBerita[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.amber.shade200,
                          child: GridTile(
                            footer: SizedBox(
                              height: 45,
                              child: GridTileBar(
                                backgroundColor: Colors.black38,
                                title: Text(
                                  berita['title'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            child: berita['image'] != null
                                ? Image.network(
                                    berita['image'] ?? '',
                                    fit: BoxFit.cover,
                                  )
                                : const Icon(
                                    Icons.image_not_supported,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
