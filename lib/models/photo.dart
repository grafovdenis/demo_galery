class Photo {
  final int id;
  final String previewURL;
  final String largeImageURL;
  final bool liked;

  const Photo({
    this.id,
    this.previewURL,
    this.largeImageURL,
    this.liked = false,
  });

  Photo copyWith({bool liked}) {
    return Photo(
      id: this.id,
      previewURL: this.previewURL,
      largeImageURL: this.largeImageURL,
      liked: liked ?? this.liked,
    );
  }

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      previewURL: json['previewURL'],
      largeImageURL: json['largeImageURL'],
    );
  }

  @override
  String toString() {
    return '{"id": $id, "previewURL": "$previewURL", "largeImageURL": "$largeImageURL"}';
  }
}
