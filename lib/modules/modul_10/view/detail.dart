import 'package:flutter/material.dart';
import 'package:praktikum_mobile_1/modules/modul_10/model/detailgame.dart';
import 'package:praktikum_mobile_1/modules/modul_10/viewmodel/fetchgame.dart';
import 'package:readmore/readmore.dart';

class Detail extends StatelessWidget {
  final int gameTerpilih;
  const Detail({super.key, required this.gameTerpilih});

  Future<Detailgame> fetchData() async {
    final jsonData = await fetchDataFromAPI(gameTerpilih);
    return Detailgame.fromJson(jsonData);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      appBar: AppBar(title: Text("Detail Game")),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final game = snapshot.data!;
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                        child: Image.network(game.thumbnail, height: 300, width: double.infinity, fit: BoxFit.cover),
                      ),
                      Positioned(
                        top: 25,
                        left: 16,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5), shape: BoxShape.circle),
                            child: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.maxFinite,
                              child: Text(
                                "Minimum Sytem Requirements",
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54.withOpacity(0.8)),
                              ),
                            ),
                            Column(
                              children: [
                                _requirementRow('OS', game.minimumSystemRequirements?.os ?? 'N/A'),
                                _requirementRow('Processor', game.minimumSystemRequirements?.processor ?? 'N/A'),
                                _requirementRow('Memory', game.minimumSystemRequirements?.memory ?? 'N/A'),
                                _requirementRow('Graphics', game.minimumSystemRequirements?.graphics ?? 'N/A'),
                                _requirementRow('Storage', game.minimumSystemRequirements?.storage ?? 'N/A'),
                              ],
                            ),
                            Container(
                              height: 200,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  _itemList(game.screenshots[0].image),
                                  SizedBox(width: 15),
                                  _itemList(game.screenshots[1].image),
                                  SizedBox(width: 15),
                                  _itemList(game.screenshots[2].image),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                              child: ReadMoreText(
                                game.description,
                                trimLines: 2,
                                colorClickableText: Colors.amberAccent.shade400,
                                trimMode: TrimMode.Line,
                                style: TextStyle(
                                  color: Colors.black54.withOpacity(0.8),
                                  height: 1.5
                                ),
                                trimCollapsedText: 'more',
                                trimExpandedText: 'less',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}

SizedBox _itemList(String url) {
  return SizedBox(width: 250, child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network(url, fit: BoxFit.cover)));
}

Row _requirementRow(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 3, child: Text(title, style: TextStyle(color: Colors.black54.withOpacity(0.8)))),
      Expanded(flex: 1, child: Text(':', style: TextStyle(color: Colors.black54.withOpacity(0.8)))),
      Expanded(flex: 8, child: Text(value, style: TextStyle(color: Colors.black54.withOpacity(0.8)))),
    ],
  );
}
