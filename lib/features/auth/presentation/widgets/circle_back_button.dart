import 'package:flutter/material.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/resources/strings_manager.dart';

/// Round back button. Pops the current route unless [onPressed] is given.
class CircleBackButton extends StatelessWidget {
  const CircleBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.iconButtonBackground,
      shape: const CircleBorder(),
      child: IconButton(
        tooltip: StringsManager.back,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints.tightFor(
          width: AppConstants.backButtonSize,
          height: AppConstants.backButtonSize,
        ),
        iconSize: AppConstants.iconSize,
        color: ColorManager.black,
        icon: const Icon(Icons.arrow_back),
        onPressed: onPressed ?? () => Navigator.maybePop(context),
      ),
    );
  }
}
