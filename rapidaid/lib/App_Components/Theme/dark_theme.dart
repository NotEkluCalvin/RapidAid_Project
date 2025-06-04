import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  visualDensity: VisualDensity.comfortable,
  useMaterial3: true,
  textTheme: TextTheme(
    headlineLarge:
        GoogleFonts.ubuntu(fontSize: 32, fontWeight: FontWeight.bold),
    bodyMedium:
        GoogleFonts.ubuntu(fontWeight: FontWeight.w800),
    bodySmall:
        GoogleFonts.ubuntu(fontWeight: FontWeight.w600),
  ),
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF000035),
    primary: Color(0xFFBB86FC),
    secondary: Color(0xFF03DAC6),
    tertiary: Color(0xFF3700B3),
    outline: Colors.white,
  ),
);
