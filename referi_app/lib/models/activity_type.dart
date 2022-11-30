import 'package:flutter/material.dart';

import 'dart:convert';

import '../utils/network_assets_urls.dart';

ActivityType gridActivityFromJson(String str) =>
    ActivityType.fromJson(json.decode(str));

String gridActivityToJson(ActivityType data) => json.encode(data.toJson());

class ActivityType {
  ActivityType({
    required this.id,
    required this.imgUrl,
    required this.tipo,
    required this.color,
  });
  final String id;
  final String? imgUrl;
  final String tipo;
  final Color color;

  factory ActivityType.fromJson(Map<String, dynamic> json) => ActivityType(
        id: json['id'],
        imgUrl: getImageUrl(json["imgUrl"]),
        tipo: json["tipo"] == "FUTBOL" ? "FÚTBOL" : json["tipo"],
        color: _getActivityColor(json["tipo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imgUrl": imgUrl,
        "tipo": tipo,
        // "color": color,
      };
}

Color _getActivityColor(String activityName) {
  switch (activityName) {
    case 'FUTBOL':
      return const Color.fromRGBO(253, 254, 255, 0.4);
    case 'GIMNASIO':
      return const Color.fromRGBO(171, 108, 252, 0.4);
    case 'DANZA':
      return const Color.fromRGBO(230, 147, 237, 0.4);
    case 'VOLLEY':
      return const Color.fromRGBO(255, 245, 154, 0.4);
    case 'TENIS':
      return const Color.fromRGBO(149, 219, 95, 0.4);
    case 'RUGBY':
      return const Color.fromRGBO(255, 90, 130, 0.4);
    case 'ARTES MARCIALES':
      return const Color.fromRGBO(149, 149, 149, 0.4);
    case 'BASKETBALL':
      return const Color.fromRGBO(236, 151, 73, 0.4);
    case 'HANDBALL':
      return const Color.fromRGBO(13, 207, 172, 0.4);
    case 'NATACIÓN':
      return const Color.fromRGBO(101, 199, 241, 0.4);
    case 'OTROS':
      return const Color.fromRGBO(0, 102, 255, 0.4);
    default:
      return const Color.fromRGBO(0, 102, 255, 0.4);
  }
}
