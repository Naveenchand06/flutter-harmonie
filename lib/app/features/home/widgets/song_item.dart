import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/features/home/models/song_model.dart';
import 'package:music_player/core/theme/app_colors.dart';
import 'package:music_player/utils/decorations/card_decoration.dart';
import 'package:music_player/utils/image_utils/image_utils.dart';

class SongItemWidget extends ConsumerWidget {
  const SongItemWidget({
    super.key,
    required this.song,
    required this.onPress,
  });

  final Function()? onPress;
  final SongModel song;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: cardDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // * Leading Image
                Hero(
                  tag: song.id ?? '-',
                  child: SizedBox(
                    height: 40.h,
                    width: 40.h,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1.0, color: Colors.white)),
                      child: ClipOval(
                          child: ImageUtil.loadNetworkImage(
                        url: song.coverUrl ?? "",
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          song.name ?? '-',
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.black,
                                  ),
                        ),
                        // Text(
                        //   " ● ",
                        //   overflow: TextOverflow.ellipsis,
                        //   style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        //         fontWeight: FontWeight.w300,
                        //         color: AppColor.grey20,
                        //         fontSize: 6.sp,
                        //       ),
                        // ),
                        // Text(
                        //   ,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                        // ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: song.authorName,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: AppColor.black,
                                    ),
                              ),
                              // TextSpan(
                              //   text: ' @ ',
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .bodySmall
                              //       ?.copyWith(fontWeight: FontWeight.w500),
                              // )
                            ],
                          ),
                        ),
                        // Text(
                        //   " ● ",
                        //   overflow: TextOverflow.ellipsis,
                        //   style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        //         fontWeight: FontWeight.w300,
                        //         color: AppColor.grey20,
                        //         fontSize: 6.sp,
                        //       ),
                        // ),
                        // Text(
                        //   '${timeago.format(postItem.updatedAt as DateTime, locale: 'en_short')} ${timeago.format(postItem.updatedAt as DateTime, locale: 'en_short') == 'now' ? '' : ' ago'}',
                        //   overflow: TextOverflow.ellipsis,
                        //   style:
                        //       Theme.of(context).textTheme.bodySmall?.copyWith(),
                        // ),
                      ],
                    ),
                    SizedBox(height: 3.w),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
