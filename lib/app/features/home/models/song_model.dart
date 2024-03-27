class SongModel {
  SongModel({
    required this.coverUrl,
    required this.songLocation,
    required this.authorName,
    required this.name,
    required this.id,
    required this.songUrl,
    required this.favoritesOf,
  });

  final String? coverUrl;
  final String? songLocation;
  final String? authorName;
  final String? name;
  final String? id;
  final String? songUrl;
  final List<String> favoritesOf;

  SongModel copyWith({
    String? coverUrl,
    String? songLocation,
    String? authorName,
    String? name,
    String? id,
    String? songUrl,
    List<String>? favoritesOf,
  }) {
    return SongModel(
      coverUrl: coverUrl ?? this.coverUrl,
      songLocation: songLocation ?? this.songLocation,
      authorName: authorName ?? this.authorName,
      name: name ?? this.name,
      id: id ?? this.id,
      songUrl: songUrl ?? this.songUrl,
      favoritesOf: favoritesOf ?? this.favoritesOf,
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
      favoritesOf: json["favoritesOf"] != null
          ? (json["favoritesOf"] as List)
              .map(
                (e) => e.toString(),
              )
              .toList()
          : [],
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
