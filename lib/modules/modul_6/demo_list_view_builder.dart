import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DemoListViewBuilder extends StatefulWidget {
  final String title;
  const DemoListViewBuilder({Key? key, required this.title}) : super(key: key);

  @override
  State<DemoListViewBuilder> createState() => _DemoListViewBuilderState();
}

class _DemoListViewBuilderState extends State<DemoListViewBuilder> {
  List dataBerita = [];
  String? errorMessage; // ✅ simpan pesan error

  Future<void> _ambilData() async {
    setState(() {
      errorMessage = null; // reset error setiap fetch
    });
    try {
      final response = await http.get(Uri.parse('https://jakpost.vercel.app/api/category/business/tech'));
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
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.amber),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child:
            errorMessage != null
                ? Center(child: Text(errorMessage!, style: const TextStyle(fontSize: 18, color: Colors.red)))
                : ListView.builder(
                  itemCount: dataBerita.length,
                  itemBuilder: (context, index) {
                    final berita = dataBerita[index];
                    return Card(
                      child: ListTile(
                        leading:
                            berita['image'] != null
                                ? Image.network(berita['image'], width: 100, fit: BoxFit.cover)
                                : Container(width: 100, color: Colors.grey, child: const Icon(Icons.image_not_supported)),
                        title: Text(berita['title'] ?? 'No Title'),
                        subtitle: Text(berita['published_at'] ?? 'No Date'),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
