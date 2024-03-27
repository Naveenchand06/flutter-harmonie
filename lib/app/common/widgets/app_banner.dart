import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/core/theme/app_colors.dart';

Widget getSecondaryAppBar(BuildContext context, WidgetRef ref) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.sp),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.white,
          ),
        ),
        // ImageUtil.loadAssetImage(
        //   path: ImagePath.logoPath,
        //   height: 30.h,
        // ),
      ],
    ),
  );
}
