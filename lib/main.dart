import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedal_commander/view/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedal Commander',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme()
      ),
      home: HomeView(),
    );
  }
}
