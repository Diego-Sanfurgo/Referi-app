// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'dart:convert';

import '/models/tarifa.dart';
import '/models/organization.dart';
import '/models/activity_type.dart';
import '/utils/network_assets_urls.dart';

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
  final Organization organizacion;
  final ActivityType tipo;
  final List<TurnoId> turnos;
  final List<Tarifa> tarifas;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cupo: json["cupo"],
        imgUrl: getImageUrl(json["imgUrl"]),
        organizacion: Organization.fromJson(json["organizacion"]),
        tipo: ActivityType.fromJson(json["tipo"]),
        turnos:
            List<TurnoId>.from(json["turnos"].map((x) => TurnoId.fromJson(x))),
        tarifas: List<Tarifa>.from(
            json["__tarifas__"].map((x) => Tarifa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "cupo": cupo,
        "imgUrl": imgUrl,
        "organizacion": organizacion.toJson(),
        "tipo": tipo.toJson(),
        "turnos": List<dynamic>.from(turnos.map((x) => x.toJson())),
        "__tarifas__": List<dynamic>.from(tarifas.map((x) => x.toJson())),
      };
}

class TurnoId {
  TurnoId({
    required this.id,
  });

  final String id;

  factory TurnoId.fromJson(Map<String, dynamic> json) => TurnoId(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
