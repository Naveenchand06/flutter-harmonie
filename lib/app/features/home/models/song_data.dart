class SongData {
  final String downloadUrl;
  final Duration totalDuration;

  SongData({
    required this.downloadUrl,
    required this.totalDuration,
  });

  SongData.unknown()
      : downloadUrl = "",
        totalDuration = Duration.zero;
}
