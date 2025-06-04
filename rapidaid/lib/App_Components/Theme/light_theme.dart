import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  visualDensity: VisualDensity.comfortable,
  useMaterial3: true,
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.ubuntu(fontWeight: FontWeight.w800),
    bodySmall: GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
  ),
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 255, 255, 255),
    primary: Color(0xFFE41F1F),
    secondary: Colors.redAccent,
    tertiary: Colors.blueGrey,
    outline: Colors.black,
  ),
);
