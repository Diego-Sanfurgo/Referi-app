import 'package:referi_app/models/dto/activity_dto.dart';

class DTOActivityFee {
  String? id;
  String? nombre;
  String? monto;
  bool? esOpcional;

  DTOFrequency? frecuencia;

  String? fechaCreacion;
  String? fechaActualizacion;
  String? fechaBaja;
  DTOActivity? actividad;

  DTOActivityFee({
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

  factory DTOActivityFee.fromJson(Map<String, dynamic> json) => DTOActivityFee(
        id: json["id"],
        nombre: json["nombre"],
        monto: json["monto"]?.toString(),
        esOpcional: json["esOpcional"],
        frecuencia: json["frecuencia"] != null
            ? DTOFrequency.fromJson(json["frecuencia"])
            : null,
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"]).toString()
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"]).toString()
            : null,
        fechaBaja: json["fechaBaja"],
        actividad: json["actividad"] != null
            ? DTOActivity.fromJsonToActivityPaymentDTO(json["actividad"])
            : null,
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
        cantDias: json["cantDias"]?.toString(),
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"]).toString()
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"]).toString()
            : null,
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
