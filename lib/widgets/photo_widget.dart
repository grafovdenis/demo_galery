import 'package:demo_galery/cubit/photos_cubit.dart';
import 'package:demo_galery/pages/photo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;
  const PhotoWidget({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        fit: StackFit.expand,
        children: [
          InkWell(
            child: Image.network(
              photo.previewURL,
              fit: BoxFit.contain,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PhotoPage(
                    photo: photo,
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              padding: const EdgeInsets.only(right: 16, bottom: 56),
              icon: Icon(
                (photo.liked) ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
              onPressed: () {
                final cubit = BlocProvider.of<PhotosCubit>(context);
                (!photo.liked)
                    ? cubit.likePhoto(photo)
                    : cubit.unlikePhoto(photo);
              },
            ),
          ),
        ],
      ),
    );
  }
}
