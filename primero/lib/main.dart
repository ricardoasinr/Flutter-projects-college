import 'package:flutter/material.dart'; //Primer paso
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MiApp()); //Segundo Paso

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi app",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<String> getData() async {
    var response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    List data = json.decode(response.body);
    print(data[1]["title"]);
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ricardo App"),
        ),
        body: Column(
          children: <Widget>[
            Center(
              child: Text("Mi primera App"),
            ),
            Image.network(
                "https://scontent.fsrz1-2.fna.fbcdn.net/v/t1.6435-9/116431939_4172510946124316_3243430972913845241_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=iuIEE-q2Rl8AX-9ZAZh&tn=esCdxzJQ_LYXFTus&_nc_ht=scontent.fsrz1-2.fna&oh=6fdd845e26231a98b062668391809905&oe=6154CBA4"),
            ElevatedButton(onPressed: getData, child: Text("Obtener datos"))
          ],
        ));
  }
}
