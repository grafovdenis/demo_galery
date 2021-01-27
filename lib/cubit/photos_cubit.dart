import 'package:bloc/bloc.dart';
import 'package:demo_galery/models/photo.dart';
import 'package:demo_galery/repository/photos_repository.dart';
import 'package:meta/meta.dart';

part 'photos_state.dart';

class PhotosCubit extends Cubit<PhotosState> {
  bool isLoading = false;

  PhotosCubit() : super(PhotosLoadingState()) {
    loadPhotos();
  }

  void loadPhotos({int page}) async {
    if (!isLoading) {
      isLoading = true;
      final newPhotos = await PhotosRepository.getPhotos(page: page);
      if (state is PhotosLoadedState) {
        emit((state as PhotosLoadedState)
            .copyWith(photos: newPhotos, page: page ?? 0));
      } else {
        emit(PhotosLoadedState(photos: newPhotos, page: page ?? 1));
      }
      isLoading = false;
    }
  }

  void likePhoto(Photo photo) async {
    final _state = state as PhotosLoadedState;
    final _photo = _state.photos
        .firstWhere((element) => element.id == photo.id)
        .copyWith(liked: true);
    emit(_state.replacePhoto(_photo.id, _photo));
  }

  void unlikePhoto(Photo photo) async {
    final _state = state as PhotosLoadedState;
    final _photo = _state.photos
        .firstWhere((element) => element.id == photo.id)
        .copyWith(liked: false);
    emit(_state.replacePhoto(_photo.id, _photo));
  }
}
