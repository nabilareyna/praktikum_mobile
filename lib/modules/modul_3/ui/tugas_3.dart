import 'package:flutter/material.dart';
import 'package:praktikum_mobile_1/modules/modul_3/ui/icon_container_widget.dart';

class Tugas3 extends StatelessWidget {
  const Tugas3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Malang", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400)),
              Text('25°C', style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconContainerWidget(temp: '20°C', icon: Icons.wb_sunny, day: "Minggu"),
                  IconContainerWidget(temp: '23°C', icon: Icons.cloudy_snowing, day: "Senin"),
                  IconContainerWidget(temp: '22°C', icon: Icons.cloud, day: "Selasa"),
                ],
              ),
            ],
          ),
        ),
    );
  }
}