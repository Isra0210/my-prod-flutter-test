import 'package:flutter/material.dart';
import 'package:my_prod_test/ui/theme/text_theme.dart';
import './color_theme.dart';

class AppTheme with MPColors, MPTextTheme {
  ThemeData makeAppTheme() {
    return ThemeData(
      textTheme: makeInputTextTheme(),
      colorScheme: const ColorScheme(
        onPrimary: MPColors.onPrimary,
        primary: MPColors.primary,
        secondary: MPColors.secondary,
        onSurface: MPColors.blackColor,
        surface: MPColors.surface,
        onSecondary: MPColors.onSecondary,
        error: MPColors.colorError,
        shadow: MPColors.greyLight,
        tertiary: MPColors.blackColor,
        onTertiary: MPColors.bgColorLighter,
        background: MPColors.bgColorDefault,
        onError: MPColors.blackColor,
        onBackground: MPColors.bgColorLighter,
        brightness: Brightness.light,
        outline: MPColors.outline,
      ),
      scaffoldBackgroundColor: MPColors.bgColorDefault,
      primaryColor: MPColors.primary,
    );
  }
}
