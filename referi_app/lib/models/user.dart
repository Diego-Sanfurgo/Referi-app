import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.email,
    required this.password,
    required this.nombre,
    required this.apellido,
    required this.dni,
    required this.telefono,
    required this.fechaNacimiento,
    this.fotoPerfil,
    required this.domicilio,
  });

  String email;
  String password;
  String nombre;
  String apellido;
  int dni;
  String telefono;
  DateTime fechaNacimiento;
  String? fotoPerfil;
  Domicilio domicilio;

  User copyWith({
    required String email,
    String? password,
    String? nombre,
    String? apellido,
    required int dni,
    String? telefono,
    required DateTime fechaNacimiento,
    String? fotoPerfil,
    Domicilio? domicilio,
  }) =>
      User(
        email: this.email,
        password: password ?? this.password,
        nombre: nombre ?? this.nombre,
        apellido: apellido ?? this.apellido,
        dni: this.dni,
        telefono: telefono ?? this.telefono,
        fechaNacimiento: this.fechaNacimiento,
        fotoPerfil: fotoPerfil ?? this.fotoPerfil,
        domicilio: domicilio ?? this.domicilio,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        dni: json["dni"],
        telefono: json["telefono"],
        fechaNacimiento: DateTime.parse(json["fechaNacimiento"]),
        fotoPerfil: json["fotoPerfil"],
        domicilio: Domicilio.fromJson(json["domicilio"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "nombre": nombre,
        "apellido": apellido,
        "dni": dni,
        "telefono": telefono,
        "fechaNacimiento": fechaNacimiento.toIso8601String(),
        "fotoPerfil": fotoPerfil,
        "domicilio": domicilio.toJson(),
      };
}

class Domicilio {
  Domicilio({
    required this.calle,
    required this.numero,
    required this.ciudad,
    required this.provincia,
  });

  String calle;
  int numero;
  String ciudad;
  String provincia;

  Domicilio copyWith({
    required String calle,
    required int numero,
    String? ciudad,
    String? provincia,
  }) =>
      Domicilio(
        calle: this.calle,
        numero: this.numero,
        ciudad: ciudad ?? this.ciudad,
        provincia: provincia ?? this.provincia,
      );

  factory Domicilio.fromJson(Map<String, dynamic> json) => Domicilio(
        calle: json["calle"],
        numero: json["numero"],
        ciudad: json["ciudad"],
        provincia: json["provincia"],
      );

  Map<String, dynamic> toJson() => {
        "calle": calle,
        "numero": numero,
        "ciudad": ciudad,
        "provincia": provincia,
      };
}
