import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/features/home/models/song_data.dart';
import 'package:music_player/core/theme/app_colors.dart';
import 'package:music_player/utils/decorations/card_decoration.dart';

class PlayerCard extends ConsumerStatefulWidget {
  const PlayerCard({
    super.key,
    required this.songData,
  });

  final SongData songData;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerCardState();
}

class _PlayerCardState extends ConsumerState<PlayerCard> {
  // bool _isLoading = true;
  bool _isPlaying = false;
  final _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _initAudioPlayer();
    });
    super.initState();
  }

  void _initAudioPlayer() {
    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _currentDuration = position;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
      decoration: cardDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _currentDuration.inSeconds.toDouble(),
                  min: 0.0,
                  max: widget.songData.totalDuration.inSeconds.toDouble(),
                  onChanged: (value) {
                    _audioPlayer.seek(Duration(seconds: value.toInt()));
                    setState(
                      () => _currentDuration = Duration(
                        seconds: value.round(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatDuration(_currentDuration),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.black.withOpacity(0.11),
                      offset: const Offset(25, 21),
                      blurRadius: 38,
                      spreadRadius: 20,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () async {
                    if (_isPlaying) {
                      _audioPlayer.pause();
                    } else {
                      _audioPlayer.play(UrlSource(widget.songData.downloadUrl));
                    }
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
                  },
                ),
              ),
              Text(
                formatDuration(widget.songData.totalDuration),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.black,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
