import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_service.dart';
void main() {
  runApp(MyApp());
}

//Las pantallas van a ser clases
//No todas las clases van a ser una pantalla
//Identificador para una pantalla: StatelessWidget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  TextEditingController apiNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController catController = TextEditingController();

  ApiService apiService = ApiService();
 SharedPreferences? sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Ricardo API',
        style: TextStyle(color: Colors.white),
      )),
      body: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            children: [
              Column(
                children: [
                  SizedBox(height: 30.0),
                ],
              )
            ],
          )),
    );
  }
}
