import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_prod_test/ui/theme/color_theme.dart';

mixin MPTextTheme {
  TextTheme makeInputTextTheme() => TextTheme(
        labelMedium: GoogleFonts.openSans(
          fontSize: 16,
          color: MPColors.secondary,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: GoogleFonts.openSans(
          fontSize: 16,
          color: MPColors.secondary,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: MPColors.secondary,
        ),
      );
}
