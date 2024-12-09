import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CustomCheckboxWithLink extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String labelText;
  final String? link1Text;
  final String? link2Text;
  final VoidCallback? onLink1Tap;
  final VoidCallback? onLink2Tap;

  const CustomCheckboxWithLink({
    super.key,
    required this.value,
    required this.onChanged,
    required this.labelText,
    this.link1Text,
    this.link2Text,
    this.onLink1Tap,
    this.onLink2Tap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: labelText,
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                if (link1Text != null)
                  TextSpan(
                    text: ' $link1Text',
                    style: const TextStyle(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onLink1Tap,
                  ),
                if (link2Text != null) const TextSpan(text: ' and'),
                if (link2Text != null)
                  TextSpan(
                    text: ' $link2Text',
                    style: const TextStyle(
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = onLink2Tap,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
