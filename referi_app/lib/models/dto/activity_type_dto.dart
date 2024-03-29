import 'package:referi_app/utils/network_assets_urls.dart';

class DTOActivityType {
  String? id;
  String? tipo;
  String? imgUrl;

  DTOActivityType({
    this.id,
    this.tipo,
    this.imgUrl,
  });

  factory DTOActivityType.fromJson(Map<String, dynamic> json) =>
      DTOActivityType(
        id: json['id'],
        imgUrl: json["imgUrl"] != null ? getImageUrl(json['imgUrl']) : null,
        tipo: json['tipo'],
      );
}
