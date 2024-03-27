import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/features/home/models/song_model.dart';
import 'package:music_player/app/features/home/services/song_services.dart';
import 'package:music_player/core/network/models/app_error_model.dart';
import 'package:music_player/core/network/models/app_response_model.dart';

final songsListProvider =
    StateNotifierProvider<SongsListNotifier, AppResponse<List<SongModel>>>(
        (ref) {
  return SongsListNotifier();
});

class SongsListNotifier extends StateNotifier<AppResponse<List<SongModel>>> {
  SongsListNotifier() : super(const AppResponse.unknown());
  final _songService = SongServices();

  Future getSongsList() async {
    try {
      state = state.showLoading(true);
      final List<QueryDocumentSnapshot> songsList =
          await _songService.getAllSongsList();
      final List<SongModel> songs = songsList
          .map((e) => SongModel.fromJson((e.data() as Map<String, dynamic>)))
          .toList();
      state = state.copyWith(
        result: songs,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: const AppErrorModel(
            statusCode: 0, errorMessage: "Something went wrong!"),
      );
    }
  }
}
