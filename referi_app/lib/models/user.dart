// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.user,
    required this.accessToken,
  });

  final User user;
  final String accessToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": accessToken,
      };
}

class User {
  User({
    required this.id,
    required this.email,
    required this.password,
    required this.nombre,
    required this.apellido,
    required this.dni,
    this.telefono,
    required this.fechaNacimiento,
    this.fotoPerfil,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
  });

  final String id;
  final String email;
  final String password;
  final String nombre;
  final String apellido;
  final int dni;
  final String? telefono;
  final DateTime fechaNacimiento;
  final String? fotoPerfil;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final DateTime? fechaBaja;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        dni: json["dni"],
        telefono: json["telefono"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        fotoPerfil: json["fotoPerfil"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "telefono": telefono,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
        "fotoPerfil": fotoPerfil,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
      };
}
