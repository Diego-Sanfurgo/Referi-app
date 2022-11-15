// To parse this JSON data, do
//
//     final organization = organizationFromJson(jsonString);

import 'dart:convert';

import 'package:referi_app/utils/network_assets_urls.dart';

Organization organizationFromJson(String str) =>
    Organization.fromJson(json.decode(str));

String organizationToJson(Organization data) => json.encode(data.toJson());

class Organization {
  Organization({
    required this.id,
    required this.nombre,
    this.logo,
    this.descripcion,
    required this.telefono,
    required this.email,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
    required this.direccion,
  });

  final String id;
  final String nombre;
  final String? logo;
  final String? descripcion;
  final String telefono;
  final String? email;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final DateTime? fechaBaja;
  final Direccion? direccion;

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json["id"],
        nombre: json["nombre"],
        logo: getImageUrl(json["logo"]),
        descripcion: json["descripcion"],
        telefono: json["telefono"],
        email: json["email"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"] != null
            ? DateTime.parse(json["fechaBaja"])
            : json["fechaBaja"],
        direccion: json["direccion"] != null
            ? Direccion.fromJson(json["direccion"])
            : json["direccion"],
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
        "direccion": direccion?.toJson(),
      };
}

class Direccion {
  Direccion({
    required this.id,
    required this.calle,
    required this.numero,
    required this.ciudad,
    required this.provincia,
  });

  final String id;
  final String calle;
  final int numero;
  final String ciudad;
  final String provincia;

  factory Direccion.fromJson(Map<String, dynamic> json) => Direccion(
        id: json["id"],
        calle: json["calle"],
        numero: json["numero"],
        ciudad: json["ciudad"],
        provincia: json["provincia"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "calle": calle,
        "numero": numero,
        "ciudad": ciudad,
        "provincia": provincia,
      };
}
