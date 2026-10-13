import 'package:taskkk/core/resources/strings_manager.dart';

class Validators {
  static final RegExp _emailRegExp = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  static const int minUsernameLength = 3;
  static const int minPasswordLength = 6;

  static bool isValidUsername(String? value) =>
      value != null && value.trim().length >= minUsernameLength;

  static bool isValidEmail(String? value) =>
      value != null && _emailRegExp.hasMatch(value.trim());

  static String? username(String? value) {
    if (value == null || value.trim().isEmpty) {
      return StringsManager.fieldRequired;
    }
    if (!isValidUsername(value)) return StringsManager.usernameTooShort;
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return StringsManager.fieldRequired;
    }
    if (!isValidEmail(value)) return StringsManager.invalidEmail;
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return StringsManager.fieldRequired;
    if (value.length < minPasswordLength) {
      return StringsManager.passwordTooShort;
    }
    return null;
  }
}
