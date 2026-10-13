import 'package:flutter/cupertino.dart';
import 'package:taskkk/core/resources/app_constants.dart';
import 'package:taskkk/core/resources/color_manager.dart';
import 'package:taskkk/core/theme/app_text_styles.dart';

/// Label on the left and a green [CupertinoSwitch] on the right.
class LabeledSwitch extends StatelessWidget {
  const LabeledSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.label),
        Transform.scale(
          scale: AppConstants.switchScale,
          alignment: AlignmentDirectional.centerEnd,
          child: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: ColorManager.success,
          ),
        ),
      ],
    );
  }
}
