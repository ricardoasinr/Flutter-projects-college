import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:primer_json/info.dart'; //Por buena practica se pone 'as http

class ApiService {
  final String url = 'https://api.publicapis.org/random';

  Future<List<Info>> getInfo() async {
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('Conectado correctamente: ' + jsonResponse['entries'][0]['API']);

      return (jsonResponse['entries'] as List)
          .map((e) => Info.fromJSON(e))
          .toList();
    }
    throw Exception("Error al llamar al API");
  }

  getData(
      List<Info> data,
      TextEditingController name,
      TextEditingController desc,
      TextEditingController link,
      TextEditingController cat) {
    name.text = data.first.api.toString();
    desc.text = data.first.description.toString();
    link.text = data.first.link.toString();
    cat.text = data.first.categoria.toString();
  }
}
