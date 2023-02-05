// To parse this JSON data, do
//
//     final dtoNotification = dtoNotificationFromJson(jsonString);

import 'dart:convert';

DTONotification dtoNotificationFromJson(String str) =>
    DTONotification.fromJson(json.decode(str));

String dtoNotificationToJson(DTONotification data) =>
    json.encode(data.toJson());

class DTONotification {
  DTONotification({
    required this.id,
    required this.idRemitente,
    required this.nombreRemitente,
    required this.tipoRemitente,
    required this.titulo,
    required this.cuerpo,
    required this.fecha,
    this.read = false,
  });

  String id;
  String idRemitente;
  String nombreRemitente;
  String tipoRemitente;
  String titulo;
  String cuerpo;
  String fecha;
  bool read;
  String? parentId;

  factory DTONotification.fromJson(Map<String, dynamic> json) =>
      DTONotification(
        id: json["id"],
        idRemitente: json["idRemitente"],
        nombreRemitente: json["nombreRemitente"],
        tipoRemitente: json["tipoRemitente"],
        titulo: json["titulo"],
        cuerpo: json["cuerpo"],
        // fecha: DateFormat.yMd("es,ES").parse(json["fecha"]).toString(),
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idRemitente": idRemitente,
        "nombreRemitente": nombreRemitente,
        "tipoRemitente": tipoRemitente,
        "titulo": titulo,
        "cuerpo": cuerpo,
        "fecha": fecha,
      };
}
