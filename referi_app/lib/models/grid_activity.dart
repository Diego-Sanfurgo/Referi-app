import 'package:flutter/material.dart';

import 'dart:convert';

import 'package:referi_app/API/params.dart';

import '../utils/network_assets_urls.dart';

GridActivity gridActivityFromJson(String str) =>
    GridActivity.fromJson(json.decode(str));

String gridActivityToJson(GridActivity data) => json.encode(data.toJson());

class GridActivity {
  GridActivity({
    required this.id,
    required this.imgUrl,
    required this.tipo,
    required this.color,
  });

  final String id;
  final String imgUrl;
  final String tipo;
  final Color color;

  factory GridActivity.fromJson(Map<String, dynamic> json) => GridActivity(
        id: json['id'],
        // imgUrl: json["imgUrl"],
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

// List<GridActivity> gridActivities = [
//   // GridActivity(
//   //     imageUrl: "assets/images/card_images/futbol.jpg",
//   //     name: "Fútbol",
//   //     color: const Color.fromRGBO(253, 254, 255, 0.4)),
//   GridActivity(
//       id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
//       imgUrl: "assets/images/card_images/gim.jpg",
//       tipo: "Gimnasio",
//       color: const Color.fromRGBO(171, 108, 252, 0.4)),
//   GridActivity(
//       id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
//       imgUrl: "assets/images/card_images/danza.jpg",
//       tipo: "Danza",
//       color: const Color.fromRGBO(230, 147, 237, 0.4)),
//   GridActivity(
//       id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
//       imgUrl: "assets/images/card_images/voley.jpg",
//       tipo: "Vóley",
//       color: const Color.fromRGBO(255, 245, 154, 0.4)),
//   GridActivity(
//       id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
//       imgUrl: "assets/images/card_images/tenis.jpg",
//       tipo: "Tenis",
//       color: const Color.fromRGBO(149, 219, 95, 0.4)),
//   GridActivity(
//       id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
//       imgUrl: "assets/images/card_images/rugby.jpg",
//       tipo: "Rugby",
//       color: const Color.fromRGBO(255, 90, 130, 0.4)),
//   GridActivity(
//       id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
//       imgUrl: "assets/images/card_images/armar.jpg",
//       tipo: "Artes marciales",
//       color: const Color.fromRGBO(149, 149, 149, 0.4)),
//   // GridActivity(
//   //   // id: "5616e318-83b3-42ae-b438-0bd86dab7592",
//   //   imageUrl: "assets/images/card_images/basket.jpg",
//   //   name: "Basket",
//   //   color: const Color.fromRGBO(236, 151, 73, 0.4),
//   // ),
//   GridActivity(
//       id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
//       imgUrl: "assets/images/card_images/handball.jpg",
//       tipo: "Handball",
//       color: const Color.fromRGBO(13, 207, 172, 0.4)),
//   GridActivity(
//       id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
//       imgUrl: "assets/images/card_images/natacion.jpg",
//       tipo: "Natación",
//       color: const Color.fromRGBO(101, 199, 241, 0.4)),
//   GridActivity(
//       id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
//       imgUrl: "assets/images/card_images/otros.jpg",
//       tipo: "Otros",
//       color: const Color.fromRGBO(0, 102, 255, 0.4)),
// ];
