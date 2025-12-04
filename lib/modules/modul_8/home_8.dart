import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:praktikum_mobile_1/modules/modul_8/screen_argument.dart';
import 'package:praktikum_mobile_1/modules/modul_8/tujuan_8.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home8 extends StatelessWidget {
  const Home8({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0081c9)), useMaterial3: true),
      initialRoute: '/',
      routes: {'/': (context) => const MyHome8(), Tujuan8.routeName: (context) => const Tujuan8()},
    );
  }
}

class MyHome8 extends StatefulWidget {
  const MyHome8({super.key});

  @override
  State<MyHome8> createState() => _MyHome8State();
}

class _MyHome8State extends State<MyHome8> {
  var title, thumbnail, short_description, description;
  var genre, platform, release, cover, gameid, publisher;

  Future getGame(String gameid) async {
    http.Response response = await http.get(Uri.parse('https://www.freetogame.com/api/game?id=$gameid'));
    var results = jsonDecode(response.body);
    setState(() {
      this.gameid = gameid;
      title = results['title'];
      thumbnail = results['thumbnail'];
      short_description = results['short_description'];
      description = results['description'];
      genre = results['genre'];
      platform = results['platform'];
      publisher = results['publisher'];
      release = results['release_date'];
      cover = results['screenshots'][0]['image'];
    });
  }

  @override
  void initState() {
    super.initState();
    getGame('475'); // ambil 1 game default
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modul 8 - Navigasi dan Passing Data"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/home');
          },
        ),
      ),
      backgroundColor: const Color(0xFF0081c9),
      body: SafeArea(
        child: Center(
          child:
              gameid == null
                  ? const CircularProgressIndicator()
                  : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Image.network(thumbnail),
                              const SizedBox(height: 15),
                              Text(title, style: const TextStyle(fontSize: 24)),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Genre: $genre"), Text("Platform: $platform")]),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Publisher: $publisher"), Text("Release: $release")]),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Tujuan8.routeName, arguments: ScreenArgument(cover: cover, title: title, description: description, shortDesc: short_description));
                        },
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
