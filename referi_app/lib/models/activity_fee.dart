// To parse this JSON data, do
//
//     final activityFee = activityFeeFromJson(jsonString);

import 'dart:convert';

ActivityFee activityFeeFromJson(String str) =>
    ActivityFee.fromJson(json.decode(str));

String activityFeeToJson(ActivityFee data) => json.encode(data.toJson());

class ActivityFee {
  ActivityFee({
    required this.id,
    required this.nombre,
    required this.monto,
    required this.esOpcional,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
    required this.frecuencia,
  });

  final String id;
  final String nombre;
  final int monto;
  final bool esOpcional;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;
  final Frecuencia frecuencia;

  factory ActivityFee.fromJson(Map<String, dynamic> json) => ActivityFee(
        id: json["id"],
        nombre: json["nombre"],
        monto: json["monto"],
        esOpcional: json["esOpcional"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
        frecuencia: Frecuencia.fromJson(json["frecuencia"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "monto": monto,
        "esOpcional": esOpcional,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
        "frecuencia": frecuencia.toJson(),
      };
}

class Frecuencia {
  Frecuencia({
    required this.id,
    required this.nombre,
    required this.cantDias,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
  });

  final String id;
  final String nombre;
  final int cantDias;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;

  factory Frecuencia.fromJson(Map<String, dynamic> json) => Frecuencia(
        id: json["id"],
        nombre: json["nombre"],
        cantDias: json["cantDias"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "cantDias": cantDias,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
      };
}
