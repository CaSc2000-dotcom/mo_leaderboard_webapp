import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background =  Color(0xFF232930); // Main body background
  static const Color surface =     Color(0xFF2E363F); // Navbar/Cards
  static const Color surfaceDark = Color(0xFF171818); // Darker stripes/inputs
  static const Color neonGreen =   Color(0xFF9EFF00); // Primary Accent
  static const Color textPrimary = Color(0xFFF0F2F6);
  static const Color textMuted =   Color(0xFF9BA3AE);
  static const Color tableRowEven =Color(0xFF465366); // Specific table row color

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: neonGreen,
      
      // Text Theme
      textTheme: TextTheme(
        // Big Headers
        displayLarge: GoogleFonts.oswald(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: textPrimary,
          height: 0.9, 
        ),
        // "Body text
        bodyMedium: GoogleFonts.inter(
          fontSize: 16,
          color: textPrimary,
        ),
        // Table data/Stats
        labelLarge: GoogleFonts.ibmPlexMono(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textPrimary,
          letterSpacing: 1.0,
        ),
      ),

      // Button Styling
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: neonGreen,
          foregroundColor: Colors.black, // Black text on neon green
          textStyle: GoogleFonts.oswald(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // CSS border-radius: 4px
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      
      // Input fields (Search bar style)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceDark,
        hintStyle: TextStyle(color: Colors.grey[600]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0xFF414952)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Color(0xFF414952)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}