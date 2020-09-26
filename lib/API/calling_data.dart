import 'dart:convert';

import 'package:http/http.dart' as http;
import '../API/picture.dart';

class HttpService {
  final String api_link = 'https://api.unsplash.com/';
  final String client_id =
      'client_id=yWV0JG6AHmLRY6hIP_dv3tmgKeloOAIq5ymZGvv_Tts';

  Future<List<Photos>> fetchPhotos() async {
    final String operation = 'photos/';

    http.Response response = await http.get(
      Uri.encodeFull(api_link + operation + "?" + client_id),
    );

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      print(body);
      List<Photos> photos =
          body.map((dynamic item) => Photos.fromJson(item)).toList();
      print(photos.length);
      return photos;
    } else {
      throw Exception('Failed to Load');
    }
  }

  fetchPhotosmore()
  {
    print("Halo");
    for(int i=0;i<10;i++)
    {
      fetchPhotos();
    }
  }

  Future<List<SearchPhotos>> searchPhotos(String keyword) async {
    final String operation = 'search/photos?query=';
    http.Response response = await http.get(
        Uri.encodeFull(api_link + operation + keyword + "&" + client_id),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> bodyResults = body['results'];
      List<SearchPhotos> searchPhotos =
          bodyResults.map((dynamic e) => SearchPhotos.fromJson(e)).toList();
      print(searchPhotos.length);
      return searchPhotos;
    } else {
      throw Exception('Failed to Load');
    }
  }
}
