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
    this.email,
    this.password,
    this.nombre,
    this.apellido,
    this.dni,
    this.telefono,
    this.fechaNacimiento,
    this.fotoPerfil,
    this.domicilio,
  });

  final String? email;
  final String? password;
  String? nombre;
  String? apellido;
  final int? dni;
  String? telefono;
  DateTime? fechaNacimiento;
  final String? fotoPerfil;
  final Domicilio? domicilio;

  UserRegister copyWith({
    String? email,
    String? password,
    String? nombre,
    String? apellido,
    int? dni,
    String? telefono,
    DateTime? fechaNacimiento,
    String? fotoPerfil,
    Domicilio? domicilio,
  }) =>
      UserRegister(
        email: email ?? this.email,
        password: password ?? this.password,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        dni: dni ?? this.dni,
        telefono: telefono ?? this.telefono,
        fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
        fotoPerfil: fotoPerfil ?? this.fotoPerfil,
        domicilio: domicilio ?? this.domicilio,
      );

  factory UserRegister.fromJson(Map<String, dynamic> json) => UserRegister(
      email: json["email"],
      password: json["password"],
      nombre: json["nombre"],
      apellido: json["apellido"],
      // dni: int.parse(json["dni"]),
      dni: (json["dni"]),
      telefono: json["telefono"],
      fechaNacimiento: DateFormat('dd/MM/yyyy').parse(json["fechaNacimiento"]),
      fotoPerfil: json["fotoPerfil"],
      domicilio: Domicilio.fromJson(json['domicilio']));

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "telefono": telefono,
        "fechaNacimiento": fechaNacimiento?.toIso8601String(),
        "fotoPerfil": fotoPerfil,
        "domicilio": domicilio?.toJson()
      };
}

class Domicilio {
  Domicilio({
    this.calle,
    this.numero,
    this.ciudad,
    this.provincia,
  });

  String? calle;
  int? numero;
  final String? ciudad;
  final String? provincia;

  Domicilio copyWith({
    String? calle,
    int? numero,
    String? ciudad,
    String? provincia,
  }) =>
      Domicilio(
        calle: calle ?? this.calle,
        numero: numero ?? this.numero,
        ciudad: ciudad ?? this.ciudad,
        provincia: provincia ?? this.provincia,
      );

  factory Domicilio.fromJson(Map<String, dynamic> json) => Domicilio(
        calle: json["calle"],
        numero: json["numero"] == "" ? null : int.parse(json["numero"]),
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
