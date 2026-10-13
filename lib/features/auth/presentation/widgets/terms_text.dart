import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/strings_manager.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key, this.onTermsPressed});

  final VoidCallback? onTermsPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      link: true,
      child: GestureDetector(
        onTap: onTermsPressed,
        child: Text.rich(
          TextSpan(
            style: AppTextStyles.label,
            children: [
              const TextSpan(text: StringsManager.termsPrefix),
              TextSpan(
                text: StringsManager.termsLink,
                style: AppTextStyles.emphasis,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
