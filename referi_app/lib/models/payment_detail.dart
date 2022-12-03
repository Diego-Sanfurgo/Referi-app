// To parse this JSON data, do
//
//     final paymentDetail = paymentDetailFromJson(jsonString);

import 'dart:convert';

import '../utils/network_assets_urls.dart';

PaymentDetail paymentDetailFromJson(String str) =>
    PaymentDetail.fromJson(json.decode(str));

String paymentDetailToJson(PaymentDetail data) => json.encode(data.toJson());

class PaymentDetail {
  PaymentDetail({
    required this.id,
    required this.fechaPago,
    this.numeroComprobante,
    required this.medioDePago,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
    required this.organizacion,
    required this.cuotas,
  });

  final String id;
  final DateTime fechaPago;
  final String? numeroComprobante;
  final String medioDePago;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;
  final Organizacion organizacion;
  final List<Cuota> cuotas;

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
        id: json["id"],
        fechaPago: DateTime.parse(json["fechaPago"]),
        numeroComprobante: json["numeroComprobante"],
        medioDePago: json["medioDePago"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
        organizacion: Organizacion.fromJson(json["organizacion"]),
        cuotas: List<Cuota>.from(json["cuotas"].map((x) => Cuota.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaPago": fechaPago.toIso8601String(),
        "numeroComprobante": numeroComprobante,
        "medioDePago": medioDePago,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
        "organizacion": organizacion.toJson(),
        "cuotas": List<dynamic>.from(cuotas.map((x) => x.toJson())),
      };
}

class Cuota {
  Cuota({
    required this.id,
    required this.monto,
    required this.periodoInicio,
    required this.periodoFin,
    required this.fechaVencimiento,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
    // required this.inscripcion,
  });

  final String id;
  final int monto;
  final DateTime periodoInicio;
  final DateTime periodoFin;
  final DateTime fechaVencimiento;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;
  // final Inscripcion inscripcion;

  factory Cuota.fromJson(Map<String, dynamic> json) => Cuota(
        id: json["id"],
        monto: json["monto"],
        periodoInicio: DateTime.parse(json["periodoInicio"]),
        periodoFin: DateTime.parse(json["periodoFin"]),
        fechaVencimiento: DateTime.parse(json["fechaVencimiento"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
        // inscripcion: Inscripcion.fromJson(json["inscripcion"]),
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
        // "inscripcion": inscripcion.toJson(),
      };
}

// class Inscripcion {
//   Inscripcion({
//     required this.id,
//     required this.fechaCreacion,
//     required this.fechaActualizacion,
//     required this.fechaBaja,
//     required this.turnoActividad,
//     required this.actividad,
//   });

//   final String id;
//   final DateTime fechaCreacion;
//   final DateTime fechaActualizacion;
//   final dynamic fechaBaja;
//   final Inscripcion turnoActividad;
//   final Actividad actividad;

//   factory Inscripcion.fromJson(Map<String, dynamic> json) => Inscripcion(
//         id: json["id"],
//         fechaCreacion: DateTime.parse(json["fechaCreacion"]),
//         fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
//         fechaBaja: json["fechaBaja"],
//         turnoActividad: Inscripcion.fromJson(json["turnoActividad"]),
//         actividad: Actividad.fromJson(json["actividad"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "fechaCreacion": fechaCreacion.toIso8601String(),
//         "fechaActualizacion": fechaActualizacion.toIso8601String(),
//         "fechaBaja": fechaBaja,
//         "turnoActividad": turnoActividad.toJson(),
//         "actividad": actividad.toJson(),
//       };
// }

class Actividad {
  Actividad({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.cupo,
    this.imgUrl,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.fechaBaja,
  });

  final String id;
  final String nombre;
  final String descripcion;
  final int cupo;
  final String? imgUrl;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;

  factory Actividad.fromJson(Map<String, dynamic> json) => Actividad(
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

class Organizacion {
  Organizacion({
    required this.id,
    required this.nombre,
    this.logo,
    this.descripcion,
    this.telefono,
    required this.email,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    required this.fechaBaja,
  });

  final String id;
  final String nombre;
  final String? logo;
  final String? descripcion;
  final String? telefono;
  final String email;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;

  factory Organizacion.fromJson(Map<String, dynamic> json) => Organizacion(
        id: json["id"],
        nombre: json["nombre"],
        logo: getImageUrl(json["logo"]),
        descripcion: json["descripcion"],
        telefono: json["telefono"],
        email: json["email"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "logo": logo,
        "descripcion": descripcion,
        "telefono": telefono,
        "email": email,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
      };
}
