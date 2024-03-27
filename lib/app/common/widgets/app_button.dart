import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/core/theme/app_colors.dart';

class AppButton extends ConsumerWidget {
  const AppButton({
    this.height,
    this.width,
    required this.title,
    required this.onPress,
    this.buttonColor,
    this.titleColor,
    this.isLoading = false,
    super.key,
  });

  final double? height;
  final double? width;
  final String title;
  final VoidCallback? onPress;
  final Color? buttonColor;
  final Color? titleColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        width: width ?? double.maxFinite,
        height: height ?? 44.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          gradient: buttonColor == null
              ? const RadialGradient(
                  colors: AppColor.mainGradients,
                  center: Alignment.center,
                  radius: 4.0,
                )
              : null,
          color: buttonColor,
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: AppColor.white,
              )
            : Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
      ),
    );
  }
}
