// To parse this JSON data, do
//
//     final UserRegisterModel = UserRegisterModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

UserRegister userRegisterFromJson(String str) =>
    UserRegister.fromJson(json.decode(str));

String userRegisterToJson(UserRegister data) => json.encode(data.toJson());

class UserRegister {
  UserRegister({
    required this.email,
    required this.password,
    required this.nombre,
    required this.apellido,
    required this.dni,
    this.telefono,
    required this.fechaNacimiento,
    this.fotoPerfil,
    required this.domicilio,
  });

  final String email;
  final String password;
  final String nombre;
  final String apellido;
  final int dni;
  final String? telefono;
  final DateTime fechaNacimiento;
  final String? fotoPerfil;
  final Domicilio domicilio;

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
      email: json["email"],
      password: json["password"],
      nombre: json["nombre"],
      apellido: json["apellido"],
      dni: int.parse(json["dni"]),
      telefono: json["telefono"],
      fechaNacimiento: DateFormat('dd/MM/yyyy').parse(json["fechaNacimiento"]),
      fotoPerfil: json["fotoPerfil"],
      domicilio: json['domicilio']);

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "telefono": telefono,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
        "fotoPerfil": fotoPerfil,
        "domicilio": domicilio.toJson()
      };
}

class Domicilio {
  Domicilio({
    required this.calle,
    required this.numero,
    required this.ciudad,
    required this.provincia,
  });

  final String calle;
  final int numero;
  final String ciudad;
  final String provincia;

  factory Domicilio.fromJson(Map<String, dynamic> json) => Domicilio(
        calle: json["calle"],
        numero: json["numero"],
        ciudad: json["ciudad"],
        provincia: json["Provincia"],
      );

  Map<String, dynamic> toJson() => {
        "calle": calle,
        "numero": numero,
        "ciudad": ciudad,
        "Provincia": provincia,
      };
}
