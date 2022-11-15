// To parse this JSON data, do
//
//     final enrollment = enrollmentFromJson(jsonString);

import 'dart:convert';

import 'package:referi_app/models/organization.dart';
import 'package:referi_app/utils/network_assets_urls.dart';

Enrollment enrollmentFromJson(String str) =>
    Enrollment.fromJson(json.decode(str));

String enrollmentToJson(Enrollment data) => json.encode(data.toJson());

class Enrollment {
  Enrollment({
    required this.id,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
    required this.turnoActividad,
    required this.organizacion,
  });

  final String id;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final DateTime? fechaBaja;
  final TurnoActividad turnoActividad;
  final Organization organizacion;

  factory Enrollment.fromJson(Map<String, dynamic> json) => Enrollment(
        id: json["id"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"] != null
            ? DateTime.parse(json["fechaBaja"])
            : json["fechaBaja"],
        turnoActividad: TurnoActividad.fromJson(json["turnoActividad"]),
        organizacion: Organization.fromJson(json["organizacion"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
        "turnoActividad": turnoActividad.toJson(),
        "organizacion": organizacion.toJson(),
      };
}

class TurnoActividad {
  TurnoActividad({
    required this.id,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
    required this.actividad,
    required this.horarios,
  });

  final String id;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final DateTime? fechaBaja;
  final EnrollmentActivity actividad;
  final List<HorarioElement> horarios;

  factory TurnoActividad.fromJson(Map<String, dynamic> json) => TurnoActividad(
        id: json["id"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"] != null
            ? DateTime.parse(json["fechaBaja"])
            : json["fechaBaja"],
        actividad: EnrollmentActivity.fromJson(json["actividad"]),
        horarios: List<HorarioElement>.from(
            json["horarios"].map((x) => HorarioElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
        "actividad": actividad.toJson(),
        "horarios": List<dynamic>.from(horarios.map((x) => x.toJson())),
      };
}

class EnrollmentActivity {
  EnrollmentActivity({
    required this.id,
    required this.nombre,
    this.descripcion,
    required this.cupo,
    this.imgUrl,
    // required this.fechaCreacion,
    // required this.fechaActualizacion,
    // required this.fechaBaja,
  });

  final String id;
  final String nombre;
  final String? descripcion;
  final int cupo;
  final String? imgUrl;
  // final DateTime fechaCreacion;
  // final DateTime fechaActualizacion;
  // final dynamic fechaBaja;

  factory EnrollmentActivity.fromJson(Map<String, dynamic> json) =>
      EnrollmentActivity(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cupo: json["cupo"],
        imgUrl: getImageUrl(json["imgUrl"]),
        // fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        // fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        // fechaBaja: DateTime.parse(json["fechaBaja"]),
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
      };
}

class HorarioElement {
  HorarioElement({
    required this.id,
    required this.fechaDesde,
    required this.espacio,
    required this.horario,
  });

  final String id;
  final DateTime fechaDesde;
  final Espacio? espacio;
  final HorarioHorario horario;

  factory HorarioElement.fromJson(Map<String, dynamic> json) => HorarioElement(
        id: json["id"],
        fechaDesde: DateTime.parse(json["fechaDesde"]),
        espacio: json["espacio"] != null
            ? Espacio.fromJson(json["espacio"])
            : json["espacio"],
        horario: HorarioHorario.fromJson(json["horario"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaDesde": fechaDesde.toIso8601String(),
        "espacio": espacio?.toJson(),
        "horario": horario.toJson(),
      };
}

class Espacio {
  Espacio({
    required this.id,
    required this.nombre,
    required this.capacidad,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.fechaBaja,
  });

  final String id;
  final String nombre;
  final int capacidad;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final DateTime? fechaBaja;

  factory Espacio.fromJson(Map<String, dynamic> json) => Espacio(
        id: json["id"],
        nombre: json["nombre"],
        capacidad: json["capacidad"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"] != null
            ? DateTime.parse(json["fechaBaja"])
            : json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "capacidad": capacidad,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
      };
}

class HorarioHorario {
  HorarioHorario({
    required this.id,
    required this.diaSemana,
    required this.horaInicio,
    required this.minutosInicio,
    required this.duracion,
    required this.fechaDesde,
  });

  final String id;
  final String diaSemana;
  final int horaInicio;
  final int minutosInicio;
  final int duracion;
  final DateTime fechaDesde;

  factory HorarioHorario.fromJson(Map<String, dynamic> json) => HorarioHorario(
        id: json["id"],
        diaSemana: json["diaSemana"],
        horaInicio: json["horaInicio"],
        minutosInicio: json["minutosInicio"],
        duracion: json["duracion"],
        fechaDesde: DateTime.parse(json["fechaDesde"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "diaSemana": diaSemana,
        "horaInicio": horaInicio,
        "minutosInicio": minutosInicio,
        "duracion": duracion,
        "fechaDesde": fechaDesde.toIso8601String(),
      };
}
