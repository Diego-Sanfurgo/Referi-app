// To parse this JSON data, do
//
//     final activityFeePayment = activityFeePaymentFromJson(jsonString);

import 'dart:convert';

import 'package:referi_app/utils/network_assets_urls.dart';

ActivityFeePayment activityFeePaymentFromJson(String str) =>
    ActivityFeePayment.fromJson(json.decode(str));

String activityFeePaymentToJson(ActivityFeePayment data) =>
    json.encode(data.toJson());

class ActivityFeePayment {
  ActivityFeePayment({
    required this.id,
    required this.monto,
    required this.periodoInicio,
    required this.periodoFin,
    required this.fechaVencimiento,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
    required this.tarifa,
    this.pago,
    required this.inscripcion,
  });

  final String id;
  final int monto;
  final DateTime periodoInicio;
  final DateTime periodoFin;
  final DateTime fechaVencimiento;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;
  final TarifaPayment tarifa;
  final dynamic pago;
  final Inscripcion inscripcion;

  factory ActivityFeePayment.fromJson(Map<String, dynamic> json) =>
      ActivityFeePayment(
        id: json["id"],
        monto: json["monto"],
        periodoInicio: DateTime.parse(json["periodoInicio"]),
        periodoFin: DateTime.parse(json["periodoFin"]),
        fechaVencimiento: DateTime.parse(json["fechaVencimiento"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
        tarifa: TarifaPayment.fromJson(json["tarifa"]),
        pago: json["pago"],
        inscripcion: Inscripcion.fromJson(json["inscripcion"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "monto": monto,
        "periodoInicio": periodoInicio.toIso8601String(),
        "periodoFin": periodoFin.toIso8601String(),
        "fechaVencimiento": fechaVencimiento.toIso8601String(),
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
        "tarifa": tarifa.toJson(),
        "pago": pago,
        "inscripcion": inscripcion.toJson(),
      };
}

class Inscripcion {
  Inscripcion({
    required this.id,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
  });

  final String id;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;

  factory Inscripcion.fromJson(Map<String, dynamic> json) => Inscripcion(
        id: json["id"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
      };
}

class TarifaPayment {
  TarifaPayment({
    required this.id,
    required this.nombre,
    required this.monto,
    required this.esOpcional,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
    required this.actividad,
  });

  final String id;
  final String nombre;
  final int monto;
  final bool esOpcional;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;
  final ActivityPayment actividad;

  factory TarifaPayment.fromJson(Map<String, dynamic> json) => TarifaPayment(
        id: json["id"],
        nombre: json["nombre"],
        monto: json["monto"],
        esOpcional: json["esOpcional"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
        actividad: ActivityPayment.fromJson(json["actividad"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "monto": monto,
        "esOpcional": esOpcional,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
        "actividad": actividad.toJson(),
      };
}

class ActivityPayment {
  ActivityPayment({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.cupo,
    this.imgUrl,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
  });

  final String id;
  final String nombre;
  final String descripcion;
  final int cupo;
  final String? imgUrl;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;

  factory ActivityPayment.fromJson(Map<String, dynamic> json) =>
      ActivityPayment(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cupo: json["cupo"],
        imgUrl: getImageUrl(json["imgUrl"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "cupo": cupo,
        "imgUrl": imgUrl,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
      };
}
