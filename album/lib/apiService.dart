import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:album/album.dart';

class ApiServices {
  final String url = "https://jsonplaceholder.typicode.com/albums/";
  Future<List<Album>> getData() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<Album> albums = [];
      for (var model in jsonResponse) {
        Album album = Album.fromJSON(model);
        albums.add(album);
      }
      return albums;
    } else {
      throw Exception("Hola Enrique");
    }
  }
}
