import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../api_client.dart';
import '../models/photo.dart';

class PhotosRepository {
  static Future<List<Photo>> getPhotos({int page}) async {
    final response = await ApiClient.getPhotos(
      page: page,
    );
    if (response.statusCode == 200) {
      return compute(_parsePhotos, response.body);
    } else {
      return [];
    }
  }

  static List<Photo> _parsePhotos(String body) {
    final parsed = jsonDecode(body);

    return parsed['hits'].map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}
