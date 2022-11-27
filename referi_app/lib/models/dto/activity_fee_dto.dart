import 'package:referi_app/models/dto/activity_dto.dart';

class DTOACtivityFee {
  String? id;
  String? nombre;
  String? monto;
  bool? esOpcional;

  DTOFrequency? frecuencia;

  String? fechaCreacion;
  String? fechaActualizacion;
  String? fechaBaja;
  DTOActivity? actividad;

  DTOACtivityFee({
    this.id,
    this.nombre,
    this.monto,
    this.esOpcional,
    this.frecuencia,
    //
    this.fechaCreacion,
    this.fechaActualizacion,
    this.fechaBaja,
    //
    this.actividad,
  });

  factory DTOACtivityFee.fromJson(Map<String, dynamic> json) => DTOACtivityFee(
        id: json["id"],
        nombre: json["nombre"],
        monto: json["monto"].toString(),
        esOpcional: json["esOpcional"],
        frecuencia: DTOFrequency.fromJson(json["frecuencia"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]).toString(),
        fechaActualizacion:
            DateTime.parse(json["fechaActualizacion"]).toString(),
        fechaBaja: json["fechaBaja"],
        actividad: DTOActivity.fromJsonToActivityPaymentDTO(json["actividad"]),
      );
}

class DTOFrequency {
  DTOFrequency({
    this.id,
    this.nombre,
    this.cantDias,
    this.fechaCreacion,
    this.fechaActualizacion,
    this.fechaBaja,
  });

  String? id;
  String? nombre;
  String? cantDias;
  String? fechaCreacion;
  String? fechaActualizacion;
  String? fechaBaja;

  factory DTOFrequency.fromJson(Map<String, dynamic> json) => DTOFrequency(
        id: json["id"],
        nombre: json["nombre"],
        cantDias: json["cantDias"].toString(),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]).toString(),
        fechaActualizacion:
            DateTime.parse(json["fechaActualizacion"]).toString(),
        fechaBaja: json["fechaBaja"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "cantDias": cantDias,
        "fechaCreacion": DateTime.parse(fechaCreacion!).toIso8601String(),
        "fechaActualizacion":
            DateTime.parse(fechaActualizacion!).toIso8601String(),
        "fechaBaja": fechaBaja,
      };
}
