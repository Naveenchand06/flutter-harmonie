import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/core/theme/app_colors.dart';

class AppTextField extends ConsumerWidget {
  const AppTextField({
    required this.label,
    this.hint,
    this.controller,
    this.inputformatters,
    this.onChange,
    this.onSubmit,
    this.inputAction = TextInputAction.next,
    this.enableTopBottomGap = true,
    this.validator,
    this.fieldEnabled,
    this.leadIcon,
    this.vertGap,
    super.key,
  });

  final String label;
  final String? hint;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputformatters;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final TextInputAction? inputAction;
  final bool enableTopBottomGap;
  final FormFieldValidator<String>? validator;
  final bool? fieldEnabled;
  final IconData? leadIcon;
  final double? vertGap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertGap ?? 10.h),
      child: TextFormField(
        cursorColor: AppColor.black,
        inputFormatters: inputformatters,
        controller: controller,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        textInputAction: inputAction,
        validator: validator,
        enabled: fieldEnabled,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColor.black,
            ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColor.azureStart,
                fontWeight: FontWeight.w500,
              ),
          hintText: hint ?? '',
          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColor.grey80,
                fontWeight: FontWeight.w400,
              ),
          filled: true,
          fillColor: AppColor.white,
          prefixIcon: leadIcon != null
              ? Icon(
                  leadIcon,
                  color: AppColor.grey80,
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.h,
            vertical: 14.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(
              color: AppColor.transparent,
              width: 1.6,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColor.azureEnd.withAlpha(100),
              width: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
