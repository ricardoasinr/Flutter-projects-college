import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'album.dart';
import 'apiService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio();

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  ApiServices service = ApiServices();
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = service.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ricardo Asin - 2020113511',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: FutureBuilder<List<Album>>(
        future: futureAlbums,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Id ' + snapshot.data[index].id.toString()),
                    subtitle: Text('Title: ' + snapshot.data[index].title),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('Ocurrio un error +${snapshot.error}');
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
              ),
            );
          }
        },
      )),
    );
  }
}
