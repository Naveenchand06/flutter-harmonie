import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/common/widgets/app_background.dart';
import 'package:music_player/app/common/widgets/app_banner.dart';
import 'package:music_player/app/common/widgets/app_error_widget.dart';
import 'package:music_player/app/common/widgets/app_loader.dart';
import 'package:music_player/app/features/home/models/song_data.dart';
import 'package:music_player/app/features/home/models/song_model.dart';
import 'package:music_player/app/features/home/repository/song_data_repository.dart';
import 'package:music_player/app/features/home/widgets/player_card.dart';
import 'package:music_player/core/network/models/app_response_model.dart';
import 'package:music_player/core/theme/app_colors.dart';
import 'package:music_player/utils/decorations/card_decoration.dart';
import 'package:music_player/utils/image_utils/image_utils.dart';

class SongScreen extends ConsumerStatefulWidget {
  const SongScreen({
    super.key,
    required this.song,
  });

  final SongModel song;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SongScreenState();
}

class _SongScreenState extends ConsumerState<SongScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref
          .read(songDataProvider.notifier)
          .getSongData(widget.song.songLocation ?? "");
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    final songData = ref.watch(songDataProvider);

    return Scaffold(
      body: AppBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(child: getSecondaryAppBar(context, ref)),
              SizedBox(height: screenHeight * 2 / 100),
              Center(
                child: Hero(
                  tag: widget.song.id ?? '-',
                  child: Container(
                    decoration: cardDecoration(radius: 22.r),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.r),
                      child: ImageUtil.loadNetworkImage(
                        url: widget.song.coverUrl ?? '',
                        height: screenHeight * 46 / 100,
                        width: screenWidth * 96 / 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                widget.song.name ?? "-",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColor.black,
                    ),
              ),
              SizedBox(height: 4.h),
              Text(
                widget.song.authorName ?? "-",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
              ),
              SizedBox(height: 14.h),
              if (songData.isLoading)
                Container(
                  width: screenWidth,
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
                  decoration: cardDecoration(),
                  child: const Center(
                    child: AppLoader(
                      color: AppColor.azureStart,
                    ),
                  ),
                )
              else if (songData.error != null)
                AppErrorWidget(
                  onPress: () {
                    ref
                        .read(songDataProvider.notifier)
                        .getSongData(widget.song.songLocation ?? "");
                  },
                )
              else if ((!songData.isLoading) &&
                  (songData.result != null) &&
                  songData != const AppResponse.unknown())
                PlayerCard(
                  songData: songData.result!,
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
