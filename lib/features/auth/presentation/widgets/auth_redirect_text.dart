import 'package:flutter/material.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';

/// "Already have an account? **Signin**" style footer.
class AuthRedirectText extends StatelessWidget {
  const AuthRedirectText({
    super.key,
    required this.prefix,
    required this.actionText,
    required this.onPressed,
  });

  final String prefix;
  final String actionText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(prefix, style: AppTextStyles.label),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: Text(actionText, style: AppTextStyles.emphasis),
        ),
      ],
    );
  }
}
