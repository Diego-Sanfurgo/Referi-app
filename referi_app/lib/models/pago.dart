// To parse this JSON data, do
//
//     final pago = pagoFromJson(jsonString);

import 'dart:convert';

Pago pagoFromJson(String str) => Pago.fromJson(json.decode(str));

String pagoToJson(Pago data) => json.encode(data.toJson());

class Pago {
  Pago({
    required this.id,
    required this.fechaPago,
    this.numeroComprobante,
    required this.medioDePago,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
  });

  final String id;
  final DateTime fechaPago;
  final dynamic numeroComprobante;
  final String medioDePago;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final dynamic fechaBaja;

  factory Pago.fromJson(Map<String, dynamic> json) => Pago(
        id: json["id"],
        fechaPago: DateTime.parse(json["fechaPago"]),
        numeroComprobante: json["numeroComprobante"],
        medioDePago: json["medioDePago"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fechaPago": fechaPago.toIso8601String(),
        "numeroComprobante": numeroComprobante,
        "medioDePago": medioDePago,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
      };
}
