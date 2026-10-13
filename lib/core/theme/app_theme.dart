import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: AppConstants.fontFamily,
      scaffoldBackgroundColor: ColorManager.background,
      colorScheme: const ColorScheme.light(
        primary: ColorManager.primary,
        onPrimary: ColorManager.white,
        error: ColorManager.error,
        surface: ColorManager.background,
        onSurface: ColorManager.textPrimary,
      ),
      textTheme: TextTheme(
        headlineMedium: AppTextStyles.headline,
        titleSmall: AppTextStyles.subtitle,
        bodyMedium: AppTextStyles.input,
        bodySmall: AppTextStyles.label,
        labelLarge: AppTextStyles.button,
      ),
    );
  }
}
