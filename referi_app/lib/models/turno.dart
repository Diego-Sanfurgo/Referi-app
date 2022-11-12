// To parse this JSON data, do
//
//     final turno = turnoFromJson(jsonString);

import 'dart:convert';

Turno turnoFromJson(String str) => Turno.fromJson(json.decode(str));

String turnoToJson(Turno data) => json.encode(data.toJson());

class Turno {
  Turno({
    required this.id,
    // required this.fechaCreacion,
    // required this.fechaActualizacion,
    // required this.fechaBaja,
    // required this.actividad,
    required this.estado,
    required this.horarios,
    required this.inscriptos,
  });

  final String id;
  // final DateTime fechaCreacion;
  // final DateTime fechaActualizacion;
  // final dynamic fechaBaja;
  // final Activity actividad;
  final Estado estado;
  final List<HorarioElement> horarios;
  final List<dynamic> inscriptos;

  Turno copyWith({
    String? id,
    // DateTime? fechaCreacion,
    // DateTime? fechaActualizacion,
    // dynamic? fechaBaja,
    // Activity? actividad,
    Estado? estado,
    List<HorarioElement>? horarios,
    List<dynamic>? inscriptos,
  }) =>
      Turno(
        id: id ?? this.id,
        // fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        // fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
        // fechaBaja: fechaBaja ?? this.fechaBaja,
        // actividad: actividad ?? this.actividad,
        estado: estado ?? this.estado,
        horarios: horarios ?? this.horarios,
        inscriptos: inscriptos ?? this.inscriptos,
      );

  factory Turno.fromJson(Map<String, dynamic> json) => Turno(
        id: json["id"],
        // fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        // fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        // fechaBaja: json["fechaBaja"],
        // actividad: Activity.fromJson(json["actividad"]),
        estado: Estado.fromJson(json["estado"]),
        horarios: List<HorarioElement>.from(
            json["horarios"].map((x) => HorarioElement.fromJson(x))),
        inscriptos: List<dynamic>.from(json["inscriptos"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        // "fechaCreacion": fechaCreacion.toIso8601String(),
        // "fechaActualizacion": fechaActualizacion.toIso8601String(),
        // "fechaBaja": fechaBaja,
        // "actividad": actividad.toJson(),
        "estado": estado.toJson(),
        "horarios": List<dynamic>.from(horarios.map((x) => x.toJson())),
        "inscriptos": List<dynamic>.from(inscriptos.map((x) => x)),
      };
}

class Tarifas {
  Tarifas({
    required this.id,
    required this.nombre,
    required this.monto,
    required this.esOpcional,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.fechaBaja,
  });

  final String id;
  final String nombre;
  final int monto;
  final bool esOpcional;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;

  // Tarifas copyWith({
  //   String id,
  //   String nombre,
  //   int monto,
  //   bool esOpcional,
  //   DateTime fechaCreacion,
  //   DateTime fechaActualizacion,
  //   dynamic fechaBaja,
  // }) =>
  //     Tarifas(
  //       id: id ?? this.id,
  //       nombre: nombre ?? this.nombre,
  //       monto: monto ?? this.monto,
  //       esOpcional: esOpcional ?? this.esOpcional,
  //       fechaCreacion: fechaCreacion ?? this.fechaCreacion,
  //       fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
  //       fechaBaja: fechaBaja ?? this.fechaBaja,
  //     );

  factory Tarifas.fromJson(Map<String, dynamic> json) => Tarifas(
        id: json["id"],
        nombre: json["nombre"],
        monto: json["monto"],
        esOpcional: json["esOpcional"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "monto": monto,
        "esOpcional": esOpcional,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
      };
}

class Estado {
  Estado({
    required this.id,
    required this.estado,
    required this.fechaCreacion,
    required this.fechaBaja,
  });

  final String id;
  final String estado;
  final DateTime fechaCreacion;
  final dynamic fechaBaja;

  // Estado copyWith({
  //   String id,
  //   String estado,
  //   DateTime fechaCreacion,
  //   dynamic fechaBaja,
  // }) =>
  //     Estado(
  //       id: id ?? this.id,
  //       estado: estado ?? this.estado,
  //       fechaCreacion: fechaCreacion ?? this.fechaCreacion,
  //       fechaBaja: fechaBaja ?? this.fechaBaja,
  //     );

  factory Estado.fromJson(Map<String, dynamic> json) => Estado(
        id: json["id"],
        estado: json["estado"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "estado": estado,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaBaja": fechaBaja,
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
  final Espacio espacio;
  final HorarioHorario horario;

  // HorarioElement copyWith({
  //   String id,
  //   DateTime fechaDesde,
  //   Espacio espacio,
  //   HorarioHorario horario,
  // }) =>
  //     HorarioElement(
  //       id: id ?? this.id,
  //       fechaDesde: fechaDesde ?? this.fechaDesde,
  //       espacio: espacio ?? this.espacio,
  //       horario: horario ?? this.horario,
  //     );

  factory HorarioElement.fromJson(Map<String, dynamic> json) => HorarioElement(
        id: json["id"],
        fechaDesde: DateTime.parse(json["fechaDesde"]),
        espacio: Espacio.fromJson(json["espacio"]),
        horario: HorarioHorario.fromJson(json["horario"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaDesde": fechaDesde.toIso8601String(),
        "espacio": espacio.toJson(),
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
  final dynamic fechaBaja;

  // Espacio copyWith({
  //   String id,
  //   String nombre,
  //   int capacidad,
  //   DateTime fechaCreacion,
  //   DateTime fechaActualizacion,
  //   dynamic fechaBaja,
  // }) =>
  //     Espacio(
  //       id: id ?? this.id,
  //       nombre: nombre ?? this.nombre,
  //       capacidad: capacidad ?? this.capacidad,
  //       fechaCreacion: fechaCreacion ?? this.fechaCreacion,
  //       fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
  //       fechaBaja: fechaBaja ?? this.fechaBaja,
  //     );

  factory Espacio.fromJson(Map<String, dynamic> json) => Espacio(
        id: json["id"],
        nombre: json["nombre"],
        capacidad: json["capacidad"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
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

  // HorarioHorario copyWith({
  //   String id,
  //   String diaSemana,
  //   int horaInicio,
  //   int minutosInicio,
  //   int duracion,
  //   DateTime fechaDesde,
  // }) =>
  //     HorarioHorario(
  //       id: id ?? this.id,
  //       diaSemana: diaSemana ?? this.diaSemana,
  //       horaInicio: horaInicio ?? this.horaInicio,
  //       minutosInicio: minutosInicio ?? this.minutosInicio,
  //       duracion: duracion ?? this.duracion,
  //       fechaDesde: fechaDesde ?? this.fechaDesde,
  //     );

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
