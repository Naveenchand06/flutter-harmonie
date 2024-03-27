import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/core/theme/app_colors.dart';

@immutable
class AlertDialogModel<T> {
  final String title;
  final String message;
  final Map<String, T> buttons;
  final bool? boolButtonColor;

  const AlertDialogModel({
    required this.title,
    required this.message,
    required this.buttons,
    this.boolButtonColor,
  });
}

extension Present<T> on AlertDialogModel<T> {
  Future<T?> present(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColor.black,
                ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColor.black,
            ),
          ),
          actions: buttons.entries.map((entry) {
            return TextButton(
              onPressed: () {
                Navigator.of(context).pop(entry.value);
              },
              child: Text(
                entry.key,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: entry.value as bool == true
                      ? AppColor.azureStart
                      : AppColor.grey30,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  bool isTrueKey(String key) {
    if (key.contains('true') || key.contains("ok") || key.contains("attend")) {
      return true;
    }
    return false;
  }
}
