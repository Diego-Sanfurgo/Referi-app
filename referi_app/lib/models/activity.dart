// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'dart:convert';

import 'package:referi_app/utils/network_assets_urls.dart';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  Activity({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.cupo,
    this.imgUrl,
    // required this.fechaCreacion,
    // required this.fechaActualizacion,
    // this.fechaBaja,
    required this.organizacion,
    required this.tipo,
    required this.turnos,
    required this.tarifas,
  });

  final String id;
  final String nombre;
  final String? descripcion;
  final int cupo;
  final String? imgUrl;
  // final DateTime fechaCreacion;
  // final DateTime fechaActualizacion;
  // final DateTime? fechaBaja;
  final Organizacion organizacion;
  final Tipo tipo;
  final List<TurnoId> turnos;
  final List<Tarifa> tarifas;

  Activity copyWith({
    String? id,
    String? nombre,
    String? descripcion,
    int? cupo,
    String? imgUrl,
    // DateTime fechaCreacion,
    // DateTime fechaActualizacion,
    // dynamic fechaBaja,
    Organizacion? organizacion,
    Tipo? tipo,
    List<TurnoId>? turnos,
    List<Tarifa>? tarifas,
  }) =>
      Activity(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        descripcion: descripcion ?? this.descripcion,
        cupo: cupo ?? this.cupo,
        imgUrl: imgUrl ?? this.imgUrl,
        // fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        // fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
        // fechaBaja: fechaBaja ?? this.fechaBaja,
        organizacion: organizacion ?? this.organizacion,
        tipo: tipo ?? this.tipo,
        turnos: turnos ?? this.turnos,
        tarifas: tarifas ?? this.tarifas,
      );

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cupo: json["cupo"],
        imgUrl: getImageUrl(json["imgUrl"]),
        // fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        // fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        // fechaBaja: json["fechaBaja"],
        organizacion: Organizacion.fromJson(json["organizacion"]),
        tipo: Tipo.fromJson(json["tipo"]),
        turnos: List<TurnoId>.from(json["turnos"].map((x) => TurnoId.fromJson(x))),
        tarifas: List<Tarifa>.from(
            json["__tarifas__"].map((x) => Tarifa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "cupo": cupo,
        "imgUrl": imgUrl,
        // "fechaCreacion": fechaCreacion.toIso8601String(),
        // "fechaActualizacion": fechaActualizacion.toIso8601String(),
        // "fechaBaja": fechaBaja,
        "organizacion": organizacion.toJson(),
        "tipo": tipo.toJson(),
        "turnos": List<dynamic>.from(turnos.map((x) => x.toJson())),
        "__tarifas__": List<dynamic>.from(tarifas.map((x) => x.toJson())),
      };
}

class Organizacion {
  Organizacion({
    required this.id,
    required this.nombre,
    this.logo,
    this.descripcion,
    required this.telefono,
    required this.email,
    // required this.fechaCreacion,
    // required this.fechaActualizacion,
    // required this.fechaBaja,
  });

  final String id;
  final String nombre;
  final String? logo;
  final String? descripcion;
  final String telefono;
  final String email;
  // final DateTime fechaCreacion;
  // final DateTime fechaActualizacion;
  // final dynamic fechaBaja;

  Organizacion copyWith({
    String? id,
    String? nombre,
    String? logo,
    String? descripcion,
    String? telefono,
    String? email,
    // DateTime fechaCreacion,
    // DateTime fechaActualizacion,
    // dynamic fechaBaja,
  }) =>
      Organizacion(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        logo: logo ?? this.logo,
        descripcion: descripcion ?? this.descripcion,
        telefono: telefono ?? this.telefono,
        email: email ?? this.email,
        // fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        // fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
        // fechaBaja: fechaBaja ?? this.fechaBaja,
      );

  factory Organizacion.fromJson(Map<String, dynamic> json) => Organizacion(
        id: json["id"],
        nombre: json["nombre"],
        logo: getImageUrl(json["logo"]),
        descripcion: json["descripcion"],
        telefono: json["telefono"],
        email: json["email"],
        // fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        // fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        // fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "logo": logo,
        "descripcion": descripcion,
        "telefono": telefono,
        "email": email,
        // "fechaCreacion": fechaCreacion.toIso8601String(),
        // "fechaActualizacion": fechaActualizacion.toIso8601String(),
        // "fechaBaja": fechaBaja,
      };
}

class Tarifa {
  Tarifa({
    required this.id,
    required this.nombre,
    required this.monto,
    required this.esOpcional,
    // required this.fechaCreacion,
    // required this.fechaActualizacion,
    // required this.fechaBaja,
  });

  final String id;
  final String nombre;
  final int monto;
  final bool esOpcional;
  // final DateTime fechaCreacion;
  // final DateTime fechaActualizacion;
  // final dynamic fechaBaja;

  Tarifa copyWith({
    String? id,
    String? nombre,
    int? monto,
    bool? esOpcional,
    // DateTime fechaCreacion,
    // DateTime fechaActualizacion,
    // dynamic fechaBaja,
  }) =>
      Tarifa(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        monto: monto ?? this.monto,
        esOpcional: esOpcional ?? this.esOpcional,
        // fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        // fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
        // fechaBaja: fechaBaja ?? this.fechaBaja,
      );

  factory Tarifa.fromJson(Map<String, dynamic> json) => Tarifa(
        id: json["id"],
        nombre: json["nombre"],
        monto: json["monto"],
        esOpcional: json["esOpcional"],
        // fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        // fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        // fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "monto": monto,
        "esOpcional": esOpcional,
        // "fechaCreacion": fechaCreacion.toIso8601String(),
        // "fechaActualizacion": fechaActualizacion.toIso8601String(),
        // "fechaBaja": fechaBaja,
      };
}

class Tipo {
  Tipo({
    required this.id,
    required this.tipo,
    required this.imgUrl,
    // required this.fechaCreacion,
    // required this.fechaBaja,
  });

  final String id;
  final String tipo;
  final String imgUrl;
  // final DateTime fechaCreacion;
  // final dynamic fechaBaja;

  Tipo copyWith({
    String? id,
    String? tipo,
    String? imgUrl,
    // DateTime fechaCreacion,
    // dynamic fechaBaja,
  }) =>
      Tipo(
        id: id ?? this.id,
        tipo: tipo ?? this.tipo,
        imgUrl: imgUrl ?? this.imgUrl,
        // fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        // fechaBaja: fechaBaja ?? this.fechaBaja,
      );

  factory Tipo.fromJson(Map<String, dynamic> json) => Tipo(
        id: json["id"],
        tipo: json["tipo"],
        imgUrl: getImageUrl(json["imgUrl"]),
        // fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        // fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "imgUrl": imgUrl,
        // "fechaCreacion": fechaCreacion.toIso8601String(),
        // "fechaBaja": fechaBaja,
      };
}

class TurnoId {
  TurnoId({
    required this.id,
    // required this.fechaCreacion,
    // required this.fechaActualizacion,
    // required this.fechaBaja,
  });

  final String id;
  // final DateTime fechaCreacion;
  // final DateTime fechaActualizacion;
  // final dynamic fechaBaja;

  TurnoId copyWith({
    String? id,
    // DateTime fechaCreacion,
    // DateTime fechaActualizacion,
    // dynamic fechaBaja,
  }) =>
      TurnoId(
        id: id ?? this.id,
        // fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        // fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
        // fechaBaja: fechaBaja ?? this.fechaBaja,
      );

  factory TurnoId.fromJson(Map<String, dynamic> json) => TurnoId(
        id: json["id"],
        // fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        // fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        // fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "fechaCreacion": fechaCreacion.toIso8601String(),
        // "fechaActualizacion": fechaActualizacion.toIso8601String(),
        // "fechaBaja": fechaBaja,
      };
}
