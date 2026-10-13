import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/resources/strings_manager.dart';

enum PasswordStrength {
  weak(StringsManager.strengthWeak, ColorManager.error),
  medium(StringsManager.strengthMedium, ColorManager.warning),
  strong(StringsManager.strengthStrong, ColorManager.success);

  const PasswordStrength(this.label, this.color);

  final String label;
  final Color color;

  static const int _mediumMinLength = 6;
  static const int _strongMinLength = 8;

  /// Scores length plus lower / upper case, digits and symbols.
  static PasswordStrength evaluate(String password) {
    if (password.length < _mediumMinLength) return PasswordStrength.weak;

    final variety = [
      RegExp(r'[a-z]'),
      RegExp(r'[A-Z]'),
      RegExp(r'\d'),
      RegExp(r'[^A-Za-z0-9]'),
    ].where((rule) => rule.hasMatch(password)).length;

    if (password.length >= _strongMinLength && variety >= 3) {
      return PasswordStrength.strong;
    }
    return variety >= 2 ? PasswordStrength.medium : PasswordStrength.weak;
  }
}
