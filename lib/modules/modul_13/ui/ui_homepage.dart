import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:praktikum_mobile_1/modules/modul_13/model/post.dart';
import 'package:http/http.dart' as http;

class UiHomepage extends StatefulWidget {
  const UiHomepage({super.key});

  @override
  State<UiHomepage> createState() => _UiHomepageState();
}

class _UiHomepageState extends State<UiHomepage> {
  Post? createdPost;
  @override
  Future<void> createPost(String title, String body) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({'title': title, 'body': body, 'userId': 1}),
      );
      if (!mounted) return;
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        setState(() {
          createdPost = Post.fromJson(data);
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to create post: ${response.statusCode}')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Future<void> updatePost(int id, String title, String body) async {
    // Ganti URL agar selalu menunjuk ke ID 1 untuk demo ini.
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

    try {
      final response = await http.put(
        url,
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'id': 1, // Sesuaikan ID di body agar konsisten
          'title': title,
          'body': body,
          'userId': 1,
        }),
      );

      if (!mounted) return;

      // Status code 200 OK menandakan update berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          // Update state 'createdPost' dengan data baru dari server.
          // Waktu pembuatan asli dipertahankan.
          createdPost = Post(
            id: data['id'],
            userId: data['userId'] ?? createdPost!.userId,
            title: data['title'],
            body: data['body'],
            createdAt: createdPost!.createdAt,
          );
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Post berhasil diupdate!'), backgroundColor: Colors.green));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Gagal mengupdate post')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  void showAddPostDialog() {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Post', style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.indigo[900])),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: titleController, decoration: InputDecoration(labelText: 'Nama')),
              TextField(controller: bodyController, decoration: InputDecoration(labelText: 'Pekerjaan')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal', style: GoogleFonts.montserrat(color: Colors.indigo[900])),
            ),
            ElevatedButton(
              onPressed: () {
                final title = titleController.text.trim();
                final body = bodyController.text.trim();
                if (title.isNotEmpty && body.isNotEmpty) {
                  createPost(title, body);
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill in all fields')));
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[900]),
              child: Text('Simpan', style: GoogleFonts.montserrat(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void showUpdatePostDialog(Post currentPost) {
    // Inisialisasi controller dengan data yang sudah ada.
    final titleController = TextEditingController(text: currentPost.title);
    final bodyController = TextEditingController(text: currentPost.body);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Update Post'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Nama')),
                TextField(controller: bodyController, decoration: const InputDecoration(labelText: 'Pekerjaan')),
              ],
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
              ElevatedButton(
                onPressed: () {
                  final updatedTitle = titleController.text.trim();
                  final updatedBody = bodyController.text.trim();

                  if (updatedTitle.isNotEmpty && updatedBody.isNotEmpty) {
                    updatePost(currentPost.id, updatedTitle, updatedBody);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nama dan Pekerjaan harus diisi')));
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo[900]),
                child: const Text('Update'),
              ),
            ],
          ),
    );
  }

  Future<void> deletePost(int id) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');

    try {
      final response = await http.delete(url, headers: {'Content-type': 'application/json; charset=UTF-8'});

      if (!mounted) return;

      // Status code 200 OK menandakan delete berhasil
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Post berhasil dihapus!'), backgroundColor: Colors.green));
        // Atur state menjadi null untuk mengembalikan UI ke keadaan semula
        setState(() {
          createdPost = null;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Gagal menghapus post'), backgroundColor: Colors.red));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red));
    }
  }

  void showDeleteConfirmationDialog(int id) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Konfirmasi Hapus'),
            content: const Text('Apakah Anda yakin ingin menghapus post ini?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // Hanya tutup dialog
                child: const Text('Batal'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup dialog
                  deletePost(id); // Panggil fungsi delete
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna merah menandakan aksi bahaya
                ),
                child: const Text('Hapus'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo CRUD client-server'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/home');
          },
        ),
      ),
      body:
          createdPost == null
              ? Text('Demo CRUD CLient-server di FLutter', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.indigo[900]))
              : ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.indigo.withOpacity(0.3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    createdPost!.title,
                                    style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.w700, color: Colors.indigo[900]),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  itemBuilder:
                                      (context) => [
                                        const PopupMenuItem(value: 'update', child: Text('Update')),
                                        const PopupMenuItem(value: 'delete', child: Text('Delete')),
                                      ],
                                  onSelected: (value) {
                                    if (value == 'update') {
                                      if (createdPost != null) {
                                        showUpdatePostDialog(createdPost!);
                                      }
                                    } else if (value == 'delete') {
                                      if (createdPost != null) {
                                        showDeleteConfirmationDialog(createdPost!.id);
                                      }
                                    }
                                    // Logika untuk 'delete' akan ditambahkan pada tahap selanjutnya
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(createdPost!.body, style: GoogleFonts.openSans(fontSize: 18, height: 1.5, color: Colors.blueGrey[900])),
                            SizedBox(height: 12),
                            Text('id: ${createdPost!.id}', style: GoogleFonts.openSans(fontSize: 14, color: Colors.blueGrey[600])),
                            SizedBox(height: 12),
                            Text('userID: ${createdPost!.userId}', style: GoogleFonts.openSans(fontSize: 14, color: Colors.blueGrey[600])),
                            SizedBox(height: 16),
                            Text(
                              DateFormat("dd MMMM yyyy, HH:mm 'WIB'").format(createdPost!.createdAt),
                              style: GoogleFonts.openSans(fontSize: 14, color: Colors.blueGrey[600], fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddPostDialog,
        backgroundColor: Colors.indigo[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}
