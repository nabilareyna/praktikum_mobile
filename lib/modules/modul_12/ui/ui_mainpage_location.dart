import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:praktikum_mobile_1/modules/modul_12/ui/ui_location_screen.dart';

class UiMainpageLocation extends StatelessWidget {
  const UiMainpageLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Example',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: UiLocationScreen(),
    );
  }
}