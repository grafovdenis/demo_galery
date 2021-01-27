import 'package:demo_galery/cubit/photos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/photo.dart';
import 'photo_widget.dart';

class PhotosWidget extends StatelessWidget {
  final List<Photo> photos;
  final int page;
  const PhotosWidget({
    Key key,
    this.photos,
    this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PhotosCubit>(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent) {
          cubit.loadPhotos(page: page + 1);
        }
        return true;
      },
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photos.length,
        shrinkWrap: false,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return PhotoWidget(photo: photos[index]);
        },
      ),
    );
  }
}
