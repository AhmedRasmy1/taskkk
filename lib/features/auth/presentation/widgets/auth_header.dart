import 'package:flutter/material.dart';
import 'package:taskkk/core/extensions/media_query_helper.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';
import 'package:taskkk/features/auth/presentation/widgets/circle_back_button.dart';

/// Back button + centered extra-bold title (+ optional grey subtitle).
/// Shared by all the auth screens.
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Align(
          alignment: AlignmentDirectional.centerStart,
          child: CircleBackButton(),
        ),
        SizedBox(height: context.verticalGap),
        Text(title, textAlign: TextAlign.center, style: AppTextStyles.headline),
        if (subtitle != null) ...[
          const SizedBox(height: AppConstants.spaceXs),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle,
          ),
        ],
      ],
    );
  }
}
