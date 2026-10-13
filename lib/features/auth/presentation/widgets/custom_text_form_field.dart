import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';

/// Minimalist field: a small grey label directly above the input, a very
/// light grey underline, and an optional trailing widget.
///
/// Pass [isValid] to show a green check once the text is valid, or [suffix]
/// for any custom trailing widget (password strength, visibility eye, ...).
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.validator,
    this.isValid,
    this.suffixBuilder,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.obscureText = false,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  final String label;
  final String? hint;
  final FormFieldValidator<String>? validator;

  /// When provided, a green check is shown while it returns `true`.
  final bool Function(String text)? isValid;

  /// Custom trailing widget, rebuilt on every text change. Takes priority
  /// over the [isValid] check mark.
  final Widget? Function(BuildContext context, String text)? suffixBuilder;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, _) => TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            autofillHints: autofillHints,
            onFieldSubmitted: onFieldSubmitted,
            style: AppTextStyles.input,
            cursorColor: ColorManager.primary,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: AppTextStyles.label,
              errorStyle: AppTextStyles.error,
              isDense: true,
              suffixIcon: _buildSuffix(context, value.text),
              suffixIconConstraints: const BoxConstraints(
                minHeight: AppConstants.iconSize,
              ),
              contentPadding: const EdgeInsets.only(
                top: AppConstants.spaceSm,
                bottom: AppConstants.spaceSm,
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.divider,
                  width: AppConstants.dividerThickness,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.primary,
                  width: AppConstants.dividerThickness,
                ),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.error,
                  width: AppConstants.dividerThickness,
                ),
              ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.error,
                  width: AppConstants.dividerThickness,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget? _buildSuffix(BuildContext context, String text) {
    final custom = suffixBuilder?.call(context, text);
    if (custom != null) return custom;
    if (isValid != null && isValid!(text)) {
      return const Icon(
        Icons.check,
        size: AppConstants.iconSize,
        color: ColorManager.success,
      );
    }
    return null;
  }
}
