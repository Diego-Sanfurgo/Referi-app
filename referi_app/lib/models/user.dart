// To parse this JSON data, do
//
//     final userRegister = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userRegisterFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userRegisterToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.user,
    required this.accessToken,
  });

  User user;
  final String accessToken;

  UserModel copyWith({
    User? user,
    String? accessToken,
  }) =>
      UserModel(
        user: user ?? this.user,
        accessToken: accessToken ?? this.accessToken,
      );

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
    required this.verificado,
    required this.fechaNacimiento,
    this.fotoPerfil,
    required this.fechaCreacion,
    required this.fechaActualizacion,
    this.fechaBaja,
    required this.domicilio,
  });

  final String id;
  final String email;
  final String password;
  final String nombre;
  final String apellido;
  final int dni;
  final String? telefono;
  final bool verificado;
  final DateTime fechaNacimiento;
  final String? fotoPerfil;
  final DateTime fechaCreacion;
  final DateTime fechaActualizacion;
  final DateTime? fechaBaja;
  final Domicilio domicilio;

  User copyWith({
    String? id,
    String? email,
    String? password,
    String? nombre,
    String? apellido,
    int? dni,
    String? telefono,
    bool? verificado,
    DateTime? fechaNacimiento,
    String? fotoPerfil,
    DateTime? fechaCreacion,
    DateTime? fechaActualizacion,
    DateTime? fechaBaja,
    Domicilio? domicilio,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        dni: dni ?? this.dni,
        telefono: telefono ?? this.telefono,
        verificado: verificado ?? this.verificado,
        fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
        fotoPerfil: fotoPerfil ?? this.fotoPerfil,
        fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
        fechaBaja: fechaBaja ?? this.fechaBaja,
        domicilio: domicilio ?? this.domicilio,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        dni: json["dni"],
        telefono: json["telefono"],
        verificado: json["verificado"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        fotoPerfil: json["fotoPerfil"],
        fechaCreacion: DateTime.parse(json["fechaCreacion"]),
        fechaActualizacion: DateTime.parse(json["fechaActualizacion"]),
        fechaBaja: json["fechaBaja"],
        domicilio: Domicilio.fromJson(json["domicilio"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "telefono": telefono,
        "verificado": verificado,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
        "fotoPerfil": fotoPerfil,
        "fechaCreacion": fechaCreacion.toIso8601String(),
        "fechaActualizacion": fechaActualizacion.toIso8601String(),
        "fechaBaja": fechaBaja,
        // "domicilio": domicilio.toJson(),
      };
}

class Domicilio {
  Domicilio({
    required this.calle,
    required this.numero,
    this.provincia,
    this.ciudad,
  });

  final String calle;
  final int numero;
  final String? provincia;
  final String? ciudad;

  Domicilio copyWith({
    String? calle,
    int? numero,
    String? provincia,
    String? ciudad,
  }) =>
      Domicilio(
        calle: calle ?? this.calle,
        numero: numero ?? this.numero,
        provincia: provincia ?? this.provincia,
        ciudad: ciudad ?? this.ciudad,
      );

  factory Domicilio.fromJson(Map<String, dynamic> json) => Domicilio(
        calle: json["calle"],
        numero: json["numero"],
        provincia: json["provincia"],
        ciudad: json["ciudad"],
      );

  Map<String, dynamic> toJson() => {
        "calle": calle,
        "numero": numero,
        "provincia": provincia,
        "ciudad": ciudad,
      };
}
