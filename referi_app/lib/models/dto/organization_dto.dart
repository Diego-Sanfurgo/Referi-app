import 'package:referi_app/models/dto/address_dto.dart';

import '../../utils/network_assets_urls.dart';

class DTOOrganization {
  String? id;
  String? nombre;
  String? logo;
  String? descripcion;
  String? telefono;
  String? email;
  DTOAddress? direccion;

  DTOOrganization({
    this.id,
    this.nombre,
    this.logo,
    this.descripcion,
    this.telefono,
    this.email,
    this.direccion,
  });

  factory DTOOrganization.fromJson(Map<String, dynamic> json) =>
      DTOOrganization(
        id: json["id"],
        nombre: json["nombre"],
        logo: json["logo"] != null ? getImageUrl(json["logo"]) : null,
        descripcion: json["descripcion"],
        telefono: json["telefono"],
        email: json["email"],
        direccion: json["direccion"] != null
            ? DTOAddress.fromJson(json["direccion"])
            : null,
      );
}
