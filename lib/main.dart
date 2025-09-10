import 'package:flutter/material.dart';
import 'package:praktikum_mobile_1/IconContainerWidget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(title: Text("Row and Column")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconContainerWidget(bgColor: Colors.red, iconColor: Colors.white, icon: Icons.favorite, text: 'Favourite Icon'),
                  IconContainerWidget(bgColor: Colors.blue, iconColor: Colors.white, icon: Icons.thumb_up, text: 'Thumb up Icon',),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconContainerWidget(bgColor: Colors.green, iconColor: Colors.white, icon: Icons.settings, text: 'Settings Icon'),
                  IconContainerWidget(bgColor: Colors.orange, iconColor: Colors.white, icon: Icons.person, text: 'Person Icon'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
