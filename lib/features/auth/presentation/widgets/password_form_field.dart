import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/resources/strings_manager.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';
import 'package:taskkk/core/utils/password_strength.dart';
import 'package:taskkk/features/auth/presentation/widgets/custom_text_form_field.dart';

/// Password field with a live strength label ("Strong" in green, ...) and a
/// show / hide visibility eye.
class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.controller,
    this.label = StringsManager.password,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    this.showStrength = true,
  });

  final TextEditingController controller;
  final String label;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final bool showStrength;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      label: widget.label,
      validator: widget.validator,
      obscureText: _obscure,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: widget.textInputAction,
      autofillHints: const [AutofillHints.password],
      onFieldSubmitted: widget.onFieldSubmitted,
      suffixBuilder: (context, text) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showStrength && text.isNotEmpty)
            _StrengthLabel(strength: PasswordStrength.evaluate(text)),
          const SizedBox(width: AppConstants.spaceSm),
          GestureDetector(
            onTap: () => setState(() => _obscure = !_obscure),
            child: Tooltip(
              message: _obscure
                  ? StringsManager.showPassword
                  : StringsManager.hidePassword,
              child: Icon(
                _obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: AppConstants.iconSize,
                color: ColorManager.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StrengthLabel extends StatelessWidget {
  const _StrengthLabel({required this.strength});

  final PasswordStrength strength;

  @override
  Widget build(BuildContext context) {
    return Text(
      strength.label,
      style: AppTextStyles.fieldHint.copyWith(color: strength.color),
    );
  }
}
