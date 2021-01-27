part of 'photos_cubit.dart';

@immutable
abstract class PhotosState {
  const PhotosState();
}

class PhotosLoadingState extends PhotosState {}

class PhotosLoadedState extends PhotosState {
  final List<Photo> photos;
  final int page;
  final int likes;

  const PhotosLoadedState({this.photos, this.page = 0, this.likes = 0});

  PhotosLoadedState copyWith({
    List<Photo> photos,
    int page,
    int likes,
  }) {
    final _photos = this.photos;
    if (photos != null) {
      _photos.addAll(photos);
    }
    return PhotosLoadedState(
      page: page ?? this.page ?? null,
      photos: _photos,
      likes: likes ?? this.likes,
    );
  }

  PhotosLoadedState replacePhoto(int id, Photo newPhoto, bool like) {
    final index =
        this.photos.indexOf(photos.firstWhere((element) => element.id == id));
    this.photos[index] = newPhoto;
    return this.copyWith(likes: (like) ? this.likes + 1 : this.likes - 1);
  }
}
