import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';

/// Full-width, edge-to-edge button pinned to the bottom of a screen. The
/// purple bar also fills the bottom safe area (home indicator / gesture bar).
class BottomActionButton extends StatelessWidget {
  const BottomActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;

    return Material(
      color: ColorManager.primary,
      child: InkWell(
        onTap: enabled ? onPressed : null,
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: AppConstants.buttonHeight,
            width: double.infinity,
            child: Center(
              child: isLoading
                  ? const SizedBox.square(
                      dimension: AppConstants.iconSize,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: ColorManager.white,
                      ),
                    )
                  : Text(
                      text,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.button,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
