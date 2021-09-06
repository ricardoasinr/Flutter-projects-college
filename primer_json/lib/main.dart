import 'package:flutter/material.dart';
import 'package:primer_json/info.dart';
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
          'Ricardo Asin  - 2020113511',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          children: [
            Column(
              children: [
                SizedBox(height: 30.0),
                TextField(
                  controller: apiNameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Nombre API",
                    fillColor: Colors.white,
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Descripcion",
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: linkController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Link",
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: catController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "Categoria",
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 200.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      List<Info> data = await apiService.getInfo();
                      getData(data, apiNameController, descController,
                          linkController, catController);
                    },
                    child: Text('Obtener info'),
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
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
