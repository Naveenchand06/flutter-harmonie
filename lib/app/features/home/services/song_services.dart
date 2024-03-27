import 'package:cloud_firestore/cloud_firestore.dart';

class SongServices {
  final _songs = FirebaseFirestore.instance.collection("songs");

  Future<List<QueryDocumentSnapshot>> getAllSongsList() async {
    try {
      final QuerySnapshot snapshot = await _songs.get();
      return snapshot.docs;
    } catch (e) {
      rethrow;
    }
  }
}
