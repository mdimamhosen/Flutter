import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiquidTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF9181EE),
        primary: const Color(0xFF9181EE),
        secondary: const Color(0xFF81C7EE),
        surface: Colors.white.withOpacity(0.1),
        onSurface: Colors.white,
      ),
      textTheme: GoogleFonts.outfitTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
    );
  }

  static const Color primaryLavender = Color(0xFF9181EE);
  static const Color secondarySky = Color(0xFF81C7EE);
  static const Color accentPurple = Color(0xFFB181EE);
}
