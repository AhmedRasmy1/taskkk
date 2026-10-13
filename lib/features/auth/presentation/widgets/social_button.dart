import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/resources/strings_manager.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';

/// Full-width rounded button with a brand icon + white label.
/// Use the named constructors for the supported providers.
class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  const SocialButton.facebook({super.key, required this.onPressed})
      : label = StringsManager.facebook,
        icon = FontAwesomeIcons.facebookF,
        color = ColorManager.facebook;

  const SocialButton.twitter({super.key, required this.onPressed})
      : label = StringsManager.twitter,
        icon = FontAwesomeIcons.twitter,
        color = ColorManager.twitter;

  const SocialButton.google({super.key, required this.onPressed})
      : label = StringsManager.google,
        icon = FontAwesomeIcons.google,
        color = ColorManager.google;

  final String label;
  final FaIconData icon;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(AppConstants.socialButtonRadius),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: AppConstants.socialButtonHeight,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                size: AppConstants.socialIconSize,
                color: ColorManager.white,
              ),
              const SizedBox(width: AppConstants.spaceSm),
              Text(label, style: AppTextStyles.socialButton),
            ],
          ),
        ),
      ),
    );
  }
}
