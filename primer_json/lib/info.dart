class Info {
  //Se crean las variables que va a devolver nuestra API
  String? api; //Significado de (?) NULL safety
  String? description;
  String? auth;
  bool? https;
  String? cors;
  String? link;
  String? categoria;

//Método constructor GENERAL
  Info({
    this.api,
    this.description,
    this.auth,
    this.https,
    this.cors,
    this.link,
    this.categoria,
  });

//Constructor especifico
  Info.newInfo({
    this.api,
    this.description,
    this.categoria,
  });

//Constructor mucho mas especifico


  factory Info.fromJSON(Map<dynamic, dynamic> json) {
    //Dynamic puede recibir cualquier tipo de dato
    //Evita conflictos
    //['API'] -> Llave
    return Info(
      api: json['API'] as String?,
      description: json['Description'] as String?,
      auth: json['Auth'] as String?,
      https: json['HTTPS'] as bool?,
      cors: json['Cors'] as String?,
      link: json['Link'] as String?,
      categoria: json['Category'] as String?,
    );
  }
}
