import 'package:flutter/material.dart';
import 'package:music_player/core/theme/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.title,
    required this.onPress,
    this.style,
  });

  final String title;
  final VoidCallback onPress;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
      onPressed: onPress,
      child: Text(
        title,
        style: style ??
            Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColor.azureStart,
                ),
      ),
    );
  }
}
