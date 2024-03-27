import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:music_player/core/theme/app_colors.dart';

class ImageUtil {
  // static Widget loadAssetSvg({
  //   required String path,
  //   double? height,
  //   double? width,
  //   BoxFit? fit,
  //   Color? color,
  // }) =>
  //     SvgPicture.asset(
  //       path,
  //       fit: fit ?? BoxFit.contain,
  //       colorFilter: color != null
  //           ? ColorFilter.mode(
  //               color,
  //               BlendMode.srcIn,
  //             )
  //           : null,
  //       height: height,
  //       width: width,
  //     );

  static Widget loadNetworkImage({
    required String url,
    double? height,
    double? width,
    BoxFit? fit,
    Widget Function(BuildContext, Object, StackTrace?)? errorHandler,
  }) =>
      Image.network(
        url,
        fit: fit ?? BoxFit.cover,
        height: height,
        width: width,
        // loadingBuilder: (context, child, loadingProgress) {
        //   return SizedBox(
        //     height: 24.h,
        //     width: 24.h,
        //     child: const CircularProgressIndicator(
        //       color: AppColor.primary1,
        //     ),
        //   );
        // },
        errorBuilder: errorHandler ??
            (context, error, stackTrace) {
              return CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColor.grey70,
                child: Icon(
                  Icons.person,
                  size: 18.sp,
                  color: Colors.black,
                ),
              );
            },
      );

  static Widget loadAssetImage({
    required String path,
    double? height,
    double? width,
    BoxFit? fit,
  }) =>
      Image.asset(
        path,
        fit: fit ?? BoxFit.contain,
        height: height,
        width: width,
      );

  static Widget loadFileImage({
    required File file,
    double? height,
    double? width,
    BoxFit? fit,
  }) =>
      Image.file(
        file,
        fit: fit ?? BoxFit.contain,
        height: height,
        width: width,
      );

  static Widget loadProfileImage({
    required String url,
    String? userAvatar,
    double? height,
    double? width,
    BoxFit? fit,
    Widget Function(BuildContext, Object, StackTrace?)? errorHandler,
  }) =>
      Image.network(
        url,
        fit: fit ?? BoxFit.cover,
        height: height,
        width: width,
        errorBuilder: errorHandler ??
            (context, error, stackTrace) {
              if (userAvatar != null && userAvatar.isNotEmpty) {
                return ImageUtil.loadNetworkImage(
                  url: userAvatar,
                  fit: fit ?? BoxFit.cover,
                  height: height,
                  width: width,
                  errorHandler: (p0, p1, p2) {
                    return CircleAvatar(
                      radius: 20.r,
                      backgroundColor: AppColor.grey70,
                      child: Icon(
                        Icons.person,
                        size: 18.sp,
                        color: Colors.black,
                      ),
                    );
                  },
                );
              }
              return CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColor.grey70,
                child: Icon(
                  Icons.person,
                  size: 18.sp,
                  color: Colors.black,
                ),
              );
            },
      );
}
