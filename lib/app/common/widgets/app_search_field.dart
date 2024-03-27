import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/core/theme/app_colors.dart';

class AppSearchField extends ConsumerWidget {
  const AppSearchField({
    required this.hint,
    this.controller,
    this.inputformatters,
    this.onChange,
    this.onSubmit,
    this.inputAction = TextInputAction.search,
    this.enableTopBottomGap = true,
    this.isLoading = false,
    required this.show,
    super.key,
  });

  final String hint;
  final bool isLoading;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputformatters;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
  final TextInputAction? inputAction;
  final bool enableTopBottomGap;
  final bool show;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return show
        ? TextFormField(
            cursorColor: AppColor.black,
            inputFormatters: inputformatters,
            controller: controller,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
            textInputAction: inputAction,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColor.black,
                ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColor.grey30,
                    fontWeight: FontWeight.w400,
                  ),
              filled: true,
              fillColor: AppColor.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(
                  color: AppColor.grey70,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r),
                borderSide: const BorderSide(
                  color: AppColor.grey70,
                  width: 1.2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 10.h,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  if (onSubmit != null) {
                    onSubmit!(controller?.text ?? '');
                  }
                },
                child: const Icon(
                  Icons.search,
                  color: AppColor.azureStart,
                ),
              ),
            ),
          )
        : Container();
  }
}
