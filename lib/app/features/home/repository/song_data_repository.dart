import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/features/home/models/song_data.dart';
import 'package:music_player/core/network/models/app_error_model.dart';
import 'package:music_player/core/network/models/app_response_model.dart';
import 'package:just_audio/just_audio.dart' as ja;

final songDataProvider =
    StateNotifierProvider<SongDataNotifier, AppResponse<SongData>>((ref) {
  return SongDataNotifier();
});

class SongDataNotifier extends StateNotifier<AppResponse<SongData>> {
  SongDataNotifier() : super(const AppResponse.unknown());
  final FirebaseStorage _storage = FirebaseStorage.instance;

  void getSongData(String location) async {
    try {
      state = state.showLoading(true);
      final url = await getDownloadUrl(location);
      final duration = await getSongDuration(url);
      state = state.copyWith(
        result: SongData(
          downloadUrl: url,
          totalDuration: duration,
        ),
        isLoading: false,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: const AppErrorModel(
          statusCode: 0,
          errorMessage: "Something went wrong!",
        ),
      );
    }
  }

  Future<String> getDownloadUrl(String storageLocation) async {
    final storageRef = _storage.refFromURL(storageLocation);
    String downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  }

  Future<Duration> getSongDuration(String url) async {
    final jaPlayer = ja.AudioPlayer();

    try {
      return await jaPlayer.setUrl(url) ?? Duration.zero;
    } catch (e) {
      return Duration.zero;
    } finally {
      jaPlayer.dispose();
    }
  }
}
