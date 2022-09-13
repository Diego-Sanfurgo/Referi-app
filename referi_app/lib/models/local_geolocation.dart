import 'dart:convert';

LocalGeolocation localGeolocationFromJson(String str) =>
    LocalGeolocation.fromJson(json.decode(str));

String localGeolocationToJson(LocalGeolocation data) =>
    json.encode(data.toJson());

class LocalGeolocation {
  LocalGeolocation({
    required this.parametros,
    required this.ubicacion,
  });

  final Parametros parametros;
  final Ubicacion ubicacion;

  LocalGeolocation copyWith({
    Parametros? parametros,
    Ubicacion? ubicacion,
  }) =>
      LocalGeolocation(
        parametros: parametros ?? this.parametros,
        ubicacion: ubicacion ?? this.ubicacion,
      );

  factory LocalGeolocation.fromJson(Map<String, dynamic> json) =>
      LocalGeolocation(
        parametros: Parametros.fromJson(json["parametros"]),
        ubicacion: Ubicacion.fromJson(json["ubicacion"]),
      );

  Map<String, dynamic> toJson() => {
        "parametros": parametros.toJson(),
        "ubicacion": ubicacion.toJson(),
      };
}

class Parametros {
  Parametros({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  Parametros copyWith({
    required double lat,
    required double lon,
  }) =>
      Parametros(
        lat: this.lat,
        lon: this.lon,
      );

  factory Parametros.fromJson(Map<String, dynamic> json) => Parametros(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class Ubicacion {
  Ubicacion({
    required this.departamento,
    required this.lat,
    required this.lon,
    required this.municipio,
    required this.provincia,
  });

  final Departamento departamento;
  final double lat;
  final double lon;
  final Departamento municipio;
  final Departamento provincia;

  Ubicacion copyWith({
    Departamento? departamento,
    double? lat,
    double? lon,
    Departamento? municipio,
    Departamento? provincia,
  }) =>
      Ubicacion(
        departamento: departamento ?? this.departamento,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon,
        municipio: municipio ?? this.municipio,
        provincia: provincia ?? this.provincia,
      );

  factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        departamento: Departamento.fromJson(json["departamento"]),
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        municipio: Departamento.fromJson(json["municipio"]),
        provincia: Departamento.fromJson(json["provincia"]),
      );

  Map<String, dynamic> toJson() => {
        "departamento": departamento.toJson(),
        "lat": lat,
        "lon": lon,
        "municipio": municipio.toJson(),
        "provincia": provincia.toJson(),
      };
}

class Departamento {
  Departamento({
    required this.id,
    required this.nombre,
  });

  final String? id;
  final String? nombre;

  Departamento copyWith({
    String? id,
    String? nombre,
  }) =>
      Departamento(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
      );

  factory Departamento.fromJson(Map<String, dynamic> json) => Departamento(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
