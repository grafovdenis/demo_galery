import 'package:demo_galery/cubit/photos_cubit.dart';
import 'package:demo_galery/widgets/photos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo galery"),
      ),
      body: BlocBuilder<PhotosCubit, PhotosState>(
        builder: (context, state) {
          if (state is PhotosLoadedState) {
            return PhotosWidget(photos: state.photos, page: state.page);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
