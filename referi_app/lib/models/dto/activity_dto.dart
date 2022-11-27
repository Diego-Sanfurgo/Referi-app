import 'package:referi_app/models/dto/activity_fee_dto.dart';
import 'package:referi_app/models/dto/activity_type_dto.dart';
import 'package:referi_app/models/dto/organization_dto.dart';

import '../../utils/network_assets_urls.dart';
import '../activity.dart';

class DTOActivity {
  String? id;
  String? nombre;
  String? descripcion;
  String? cupo;
  String? imgUrl;

  DTOOrganization? organization;
  DTOActivityType? type;
  List<TurnoId>? shifts;
  List<DTOACtivityFee>? fees;

  String? fechaCreacion;
  String? fechaActualizacion;
  String? fechaBaja;

  DTOActivity({
    this.id,
    this.nombre,
    this.descripcion,
    this.cupo,
    this.imgUrl,
    this.organization,
    this.type,
    this.shifts,
    this.fees,
    this.fechaActualizacion,
    this.fechaBaja,
    this.fechaCreacion,
  });

  factory DTOActivity.fromJson(Map<String, dynamic> json) => DTOActivity(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        cupo: json["cupo"].toString(),
        imgUrl: getImageUrl(json["imgUrl"]),
        organization: DTOOrganization.fromJson(json["organizacion"]),
        type: DTOActivityType.fromJson(json['tipo']),
        // shifts: List<String>.from(json["turnos"].map(x) => x["id"]),
        shifts:
            List<TurnoId>.from(json["turnos"].map((x) => TurnoId.fromJson(x))),
        fees: List<DTOACtivityFee>.from(
            json["__tarifas__"].map((x) => DTOACtivityFee.fromJson(x))),
        fechaCreacion: DateTime.parse(json["fechaCreacion"]).toString(),
        fechaActualizacion:
            DateTime.parse(json["fechaActualizacion"]).toString(),
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
