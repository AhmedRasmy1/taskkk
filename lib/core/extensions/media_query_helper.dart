import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/app_constants.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// [factor] (0..1) of the screen width.
  double widthPercent(double factor) => screenWidth * factor;

  /// [factor] (0..1) of the screen height.
  double heightPercent(double factor) => screenHeight * factor;

  /// Horizontal page padding relative to the screen width.
  double get pageHorizontalPadding =>
      widthPercent(AppConstants.horizontalPaddingFactor);

  /// Vertical gap relative to the screen height.
  double get verticalGap => heightPercent(AppConstants.verticalGapFactor);
}
