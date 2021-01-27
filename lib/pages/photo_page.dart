import 'package:demo_galery/cubit/photos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/photo.dart';

class PhotoPage extends StatefulWidget {
  final Photo photo;
  const PhotoPage({Key key, this.photo}) : super(key: key);

  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  bool liked;

  @override
  void initState() {
    liked = widget.photo.liked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              (liked) ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              final cubit = BlocProvider.of<PhotosCubit>(context);
              (!liked)
                  ? cubit.likePhoto(widget.photo)
                  : cubit.dislikePhoto(widget.photo);
              setState(() {
                liked = !liked;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Image.network(widget.photo.largeImageURL),
      ),
    );
  }
}
