import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/color_manager.dart';

/// Single source of truth for typography (Inter).
///
/// Inter is bundled as a variable font, so the weight is applied both through
/// [FontWeight] and the `wght` font variation to guarantee the exact weight.
class AppTextStyles {
  static TextStyle _base({
    required double size,
    required FontWeight weight,
    required Color color,
    double? height,
  }) {
    return TextStyle(
      fontFamily: AppConstants.fontFamily,
      fontSize: size,
      fontWeight: weight,
      fontVariations: [FontVariation.weight(weight.value.toDouble())],
      color: color,
      height: height,
    );
  }

  /// Screen titles: "Let's Get Started", "Sign Up", "Welcome".
  static final TextStyle headline = _base(
    size: AppConstants.fontHeadline,
    weight: FontWeight.w800,
    color: ColorManager.black,
  );

  /// Under-title text.
  static final TextStyle subtitle = _base(
    size: AppConstants.fontSubtitle,
    weight: FontWeight.w400,
    color: ColorManager.textSecondary,
  );

  /// Text entered inside fields.
  static final TextStyle input = _base(
    size: AppConstants.fontBody,
    weight: FontWeight.w500,
    color: ColorManager.black,
  );

  /// Small grey label above a field, and other helper texts.
  static final TextStyle label = _base(
    size: AppConstants.fontLabel,
    weight: FontWeight.w400,
    color: ColorManager.textSecondary,
  );

  /// Error message under a field.
  static final TextStyle error = _base(
    size: AppConstants.fontCaption,
    weight: FontWeight.w400,
    color: ColorManager.error,
  );

  /// Trailing "Strong" / "Medium" / "Weak" text in password fields.
  static final TextStyle fieldHint = _base(
    size: AppConstants.fontCaption,
    weight: FontWeight.w500,
    color: ColorManager.success,
  );

  /// Bold black emphasis inside small texts ("Signin", "Term and Condition").
  static final TextStyle emphasis = _base(
    size: AppConstants.fontLabel,
    weight: FontWeight.w700,
    color: ColorManager.black,
  );

  /// Text of the main bottom button and of social buttons.
  static final TextStyle button = _base(
    size: AppConstants.fontButton,
    weight: FontWeight.w700,
    color: ColorManager.white,
  );

  static final TextStyle socialButton = _base(
    size: AppConstants.fontBody,
    weight: FontWeight.w500,
    color: ColorManager.white,
  );
}
