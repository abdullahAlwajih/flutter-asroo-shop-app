import 'package:flutter/material.dart';

part 'app_colors.dart';

abstract class AppThemes {
  static final light = ThemeData(
    colorScheme: AppColors.colorSchemeLight,
    primarySwatch: AppColors.primarySwatchLight,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    colorScheme: AppColors.colorSchemeDark,
    primarySwatch: AppColors.primarySwatchDark,
  );
}
