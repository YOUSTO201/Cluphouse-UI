import 'package:cluphouse/constants.dart';
import 'package:cluphouse/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cluphouse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: kBackgroundColor,
          foregroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: Colors.yellow,
          ),
          bodySmall: GoogleFonts.montserrat(
            fontSize: 16.0,
            color: kTanyloon
          ),
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 32.0,
            color: Colors.white,
          ),
          headlineMedium: GoogleFonts.nunito(
            fontSize: 32.0,
            color: Colors.white,),
        ),
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        hintColor: kHintColorBlue,
        bottomAppBarColor: kIndiaa,
        iconTheme: IconThemeData(color: Colors.white),
        // fontFamily: GoogleFonts.montserrat().fontFamily,
        // textTheme: GoogleFonts.montserratTextTheme(),
      ),
      
      home: HomeScreen(),
    );
  }
}
