import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_prod_test/ui/theme/color_theme.dart';

mixin MPTextTheme  {
  TextTheme makeInputTextTheme() => TextTheme(
        bodyMedium: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
          color: MPColors.secondary,
        ),
        bodySmall: GoogleFonts.openSans(
          fontWeight: FontWeight.normal,
          color: MPColors.secondary,
        ),
      );
}
