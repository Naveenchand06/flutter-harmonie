import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/core/theme/app_colors.dart';

BoxDecoration cardDecoration({double? radius}) => BoxDecoration(
      color: AppColor.white.withAlpha(220),
      borderRadius: BorderRadius.circular(radius ?? 16.r),
      boxShadow: [
        BoxShadow(
          color: const Color(0x00000000).withOpacity(0.11),
          offset: const Offset(25, 21),
          blurRadius: 38,
          spreadRadius: 20,
        ),
      ],
    );
