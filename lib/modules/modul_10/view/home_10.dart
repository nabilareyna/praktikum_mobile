import 'package:flutter/material.dart';
import 'package:praktikum_mobile_1/modules/modul_10/model/game.dart';
import 'package:praktikum_mobile_1/modules/modul_10/viewmodel/fetchgame.dart';


class Home10 extends StatefulWidget {
  const Home10({super.key});

  @override
  State<Home10> createState() => __Home10State();
}

class __Home10State extends State<Home10> {
  late Future<List<Game>> gameList;
  @override
  void initState() {
    super.initState();
    loadGames();
  }

  Future<List<Game>> loadGames() async {
    gameList = fetchGames();
    return gameList;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              _searchBar(),
              SizedBox(height: 10),
              FutureBuilder<List<Game>>(
                future: fetchGames(), // Memanggil fungsi fetchGames dari viewmodel
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(child: Center(child: CircularProgressIndicator()));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('Tidak ada data game.');
                  } else {
                    final games = snapshot.data!.take(25).toList();
                    return Expanded(
                      child: ListView.builder(
                        itemCount: games.length,
                        itemBuilder: (context, index) {
                          final game = games[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail', // Route berlabel untuk halaman detail
                                arguments: game.id, // Mengirim id game ke halaman detail
                              );
                            },
                            child: _listItem(game.thumbnail, game.title, game.genre),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextField _searchBar() {
  return TextField(
    cursorColor: Colors.blue,
    decoration: InputDecoration(
      hintText: "Cari Game",
      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 14),
      prefixIcon: Icon(Icons.search_outlined, color: Colors.blue, size: 30),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(width: 0, style: BorderStyle.none)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      filled: true,
      fillColor: Colors.blue.shade50,
    ),
  );
}

Card _listItem(String urlCover, String judul, String genre) {
  return Card(
    clipBehavior: Clip.antiAlias,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: ListTile(
      tileColor: Colors.blue.shade50,
      leading: SizedBox(
        width: 75,
        height: 75,
        child: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(urlCover, scale: 3, fit: BoxFit.cover)),
      ),
      title: Text(judul),
      subtitle: Text(genre),
      trailing: const Icon(Icons.more_vert),
      isThreeLine: false,
      titleAlignment: ListTileTitleAlignment.center,
    ),
  );
}
