import 'package:flutter/material.dart';

class IconContainerWidget extends StatelessWidget {
  IconContainerWidget({super.key, this.bgColor, this.iconColor, this.icon, this.text});

  final Color? bgColor;
  final Color? iconColor;
  final IconData? icon;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(color: bgColor, border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: iconColor, size: 40),
        ),
        SizedBox(height: 5,),
        Text(text ?? '')
      ],
    );
  }
}
