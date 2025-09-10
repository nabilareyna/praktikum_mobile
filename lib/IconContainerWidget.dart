import 'package:flutter/material.dart';

class IconContainerWidget extends StatelessWidget {
  final String day;
  final String temp;
  final IconData icon;
  IconContainerWidget({super.key, required this.day, required this.temp, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 8),
        Icon(icon, size: 32),
        const SizedBox(height: 5),
        Text(temp, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
