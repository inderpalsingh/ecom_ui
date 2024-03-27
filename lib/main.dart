import 'package:google_fonts/google_fonts.dart';

import 'screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecom UI',
      theme: ThemeData(useMaterial3: true, fontFamily: GoogleFonts.poppins().fontFamily),
      home: HomeScreen(),
    );
  }
}