import '/models/dto/activity_fee_dto.dart';
import '/models/dto/organization_dto.dart';
import '/models/dto/activity_type_dto.dart';

import '../../utils/network_assets_urls.dart';
import '../activity.dart';

class DTOActivity {
  String? id;
  String? nombre;
  String? descripcion;
  String? cupo;
  String? imgUrl;

  DTOOrganization? organizacion;
  DTOActivityType? type;
  List<TurnoId>? turnos;
  List<DTOActivityFee>? tarifas;

  String? fechaCreacion;
  String? fechaActualizacion;
  String? fechaBaja;

  DTOActivity({
    this.id,
    this.nombre,
    this.descripcion,
    this.cupo,
    this.imgUrl,
    this.organizacion,
    this.type,
    this.turnos,
    this.tarifas,
    this.fechaActualizacion,
    this.fechaBaja,
    this.fechaCreacion,
  });

  factory DTOActivity.fromJson(Map<String, dynamic> json) => DTOActivity(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cupo: json["cupo"]?.toString(),
        imgUrl: json["imgUrl"] != null ? getImageUrl(json["imgUrl"]) : null,
        organizacion: json["organizacion"] != null
            ? DTOOrganization.fromJson(json["organizacion"])
            : null,
        type: json["tipo"] != null
            ? DTOActivityType.fromJson(json['tipo'])
            : null,
        // shifts: List<String>.from(json["turnos"].map(x) => x["id"]),
        turnos: json["turnos"] != null
            ? List<TurnoId>.from(json["turnos"].map((x) => TurnoId.fromJson(x)))
            : null,
        tarifas: json["__tarifas__"] != null
            ? List<DTOActivityFee>.from(
                json["__tarifas__"].map((x) => DTOActivityFee.fromJson(x)))
            : null,
        fechaCreacion: json["fechaCreacion"] != null
            ? DateTime.parse(json["fechaCreacion"]).toString()
            : null,
        fechaActualizacion: json["fechaActualizacion"] != null
            ? DateTime.parse(json["fechaActualizacion"]).toString()
            : null,
        fechaBaja: json["fechaBaja"],
      );

  factory DTOActivity.fromJsonToActivityPaymentDTO(Map<String, dynamic> json) =>
      DTOActivity(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cupo: json["cupo"],
        imgUrl: getImageUrl(json["imgUrl"]),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]).toString(),
        fechaActualizacion:
            DateTime.parse(json["fechaActualizacion"]).toString(),
        fechaBaja: json["fechaBaja"],
      );
}
