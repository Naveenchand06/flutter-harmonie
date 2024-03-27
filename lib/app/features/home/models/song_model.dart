class SongModel {
  SongModel({
    required this.coverUrl,
    required this.songLocation,
    required this.authorName,
    required this.name,
    required this.id,
    required this.songUrl,
  });

  final String? coverUrl;
  final String? songLocation;
  final String? authorName;
  final String? name;
  final String? id;
  final String? songUrl;

  SongModel copyWith({
    String? coverUrl,
    String? songLocation,
    String? authorName,
    String? name,
    String? id,
    String? songUrl,
  }) {
    return SongModel(
      coverUrl: coverUrl ?? this.coverUrl,
      songLocation: songLocation ?? this.songLocation,
      authorName: authorName ?? this.authorName,
      name: name ?? this.name,
      id: id ?? this.id,
      songUrl: songUrl ?? this.songUrl,
    );
  }

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
      coverUrl: json["coverURL"],
      songLocation: json["songLocation"],
      authorName: json["authorName"],
      name: json["name"],
      id: json["id"],
      songUrl: json["songUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "coverURL": coverUrl,
        "songLocation": songLocation,
        "authorName": authorName,
        "name": name,
        "id": id,
        "songUrl": songUrl,
      };

  @override
  String toString() {
    return "$coverUrl, $songLocation, $authorName, $name, $id, $songUrl, ";
  }
}
