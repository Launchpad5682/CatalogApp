import 'package:flutter/foundation.dart';

class Photos {
  String id;
  String description;
  String alt_description;
  String full_url;
  String small_url;
  String thumb_url;
  String instagram_username;
  int likes;

  Photos({
    @required this.id,
    @required this.description,
    @required this.alt_description,
    @required this.full_url,
    @required this.small_url,
    @required this.thumb_url,
    @required this.instagram_username,
    @required this.likes,
  });

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      id: json['id'] as String,
      description: json['description'] as String,
      alt_description: json['alt_description'] as String,
      full_url: json['urls']['full'] as String,
      small_url: json['urls']['small'] as String,
      thumb_url: json['urls']['thumb'] as String,
      instagram_username: json['instagram_username'] as String,
      likes: json['likes'] as int,
    );
  }
}

class SearchPhotos {
  String id;
  String description;
  String alt_description;
  String full_url;
  String small_url;
  String instagram_username;

  SearchPhotos({
    this.id,
    this.description,
    this.alt_description,
    this.full_url,
    this.small_url,
    this.instagram_username,
  });

  factory SearchPhotos.fromJson(Map<String, dynamic> json) {
    return SearchPhotos(
      id: json['id'] as String,
      description: json['description'] as String,
      alt_description: json['alt_description'] as String,
      full_url: json['urls']['full'] as String,
      small_url: json['urls']['small'] as String,
      instagram_username: json['instagram_username'] as String,
    );
  }
}
