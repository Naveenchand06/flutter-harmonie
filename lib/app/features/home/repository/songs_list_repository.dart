import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/features/home/models/like_type.dart';
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
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: const AppErrorModel(
            statusCode: 0, errorMessage: "Something went wrong!"),
      );
    }
  }

  Future markAsFavorite(
    String songId,
    String userId, {
    required LikeType liketype,
  }) async {
    List<SongModel> allSongs = state.result!;
    SongModel song = allSongs.firstWhere((element) => element.id == songId,
        orElse: () => allSongs.first);
    int index = allSongs.indexWhere((element) => element.id == songId);
    List<String> likesList = song.favoritesOf;
    if (liketype == LikeType.like) {
      likesList.add(userId);
    } else {
      likesList.remove(userId);
    }
    favoriteSong(songId, likesList);
    song = song.copyWith(favoritesOf: likesList);
    allSongs.removeAt(index);
    allSongs.insert(index, song);
    state = state.copyWith(result: allSongs);
  }

  Future<void> favoriteSong(
    String docId,
    List<String> favList,
  ) async {
    DocumentReference songRef = _firestore.collection('songs').doc(docId);

    await songRef.update({
      "favoritesOf": favList,
    });
  }
}
