import 'package:e5d_assesment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppThemes {
  main,
  dark;

  ThemeData get theme {
    switch (this) {
      case AppThemes.main:
        return ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: E5DColors.primaryColor,
            secondary: E5DColors.secondaryColor,
          ),
          textTheme: GoogleFonts.interTextTheme(),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          useMaterial3: true,
        );
      case AppThemes.dark:
        return ThemeData.dark(
          useMaterial3: true,
        );

      default:
        return ThemeData();
    }
  }
}
