import 'package:flutter/material.dart';
import 'package:praktikum_mobile_1/modules/modul_2/ui/icon_container_widget.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row & Column")),
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
    );
  }
}