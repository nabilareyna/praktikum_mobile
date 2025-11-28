import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:praktikum_mobile_1/modules/modul_13/ui/ui_homepage.dart';

class UiMainpage extends StatelessWidget {
  const UiMainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter CRUD Demo",
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.lightBlueAccent),
        scaffoldBackgroundColor: Colors.blueGrey[50],
        appBarTheme: AppBarTheme(
        backgroundColor: Colors.indigo[900],
        elevation: 4,
        titleTextStyle: GoogleFonts.montserrat(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white,),
      )),
      debugShowCheckedModeBanner: false,
      home: UiHomepage(),
    );
  }
}