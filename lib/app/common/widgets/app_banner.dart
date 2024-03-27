import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/features/authentication/repository/auth_repository.dart';
import 'package:music_player/core/theme/app_colors.dart';
import 'package:music_player/utils/dialogs/logout_dialog.dart';
import 'package:music_player/utils/dialogs/models/alert_dialog_model.dart';
import 'package:music_player/utils/image_utils/image_path.dart';
import 'package:music_player/utils/image_utils/image_utils.dart';

Widget getAppBar(BuildContext context, WidgetRef ref) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.sp),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImageUtil.loadAssetImage(
          path: ImagePath.logoPath,
          height: 30.h,
          // width: 80.h,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColor.white,
              ),
            ),
            IconButton(
              onPressed: () async {
                final logout =
                    await const LogoutDialog().present(context) ?? false;
                if (logout) {
                  ref.read(authStateProvider.notifier).logOut();
                }
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: AppColor.white,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

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
