import 'package:flutter/material.dart';

class Praktikum5Card extends StatelessWidget {
  const Praktikum5Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Demo"), backgroundColor: Colors.amber),
      body: Card(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.location_pin, color: Colors.red),
              title: Text("Taman Nasional Bromo Tengger Semeru", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              subtitle: Text("Jawa Timur, Indonesia"),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.blue)), child: Icon(Icons.map)),
                  SizedBox(width: 10),
                  OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.blue)), child: Icon(Icons.phone)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
