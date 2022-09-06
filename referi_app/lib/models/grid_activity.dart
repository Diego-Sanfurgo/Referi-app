import 'package:flutter/material.dart';

import 'dart:convert';

GridActivity gridActivityFromJson(String str) =>
    GridActivity.fromJson(json.decode(str));

String gridActivityToJson(GridActivity data) => json.encode(data.toJson());

class GridActivity {
  GridActivity({
    required this.imagePath,
    required this.name,
    required this.color,
  });

  final String imagePath;
  final String name;
  final Color color;

  factory GridActivity.fromJson(Map<String, dynamic> json) => GridActivity(
        imagePath: json["imagePath"],
        name: json["name"],
        color: Color(json["color"]),
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "name": name,
        "color": color,
      };
}

List<GridActivity> gridActivities = [
  GridActivity(
      imagePath: "assets/images/card_images/futbol.jpg",
      name: "Fútbol",
      color: const Color.fromRGBO(253, 254, 255, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/gim.jpg",
      name: "Gimnasio",
      color: const Color.fromRGBO(171, 108, 252, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/danza.jpg",
      name: "Danza",
      color: const Color.fromRGBO(230, 147, 237, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/voley.jpg",
      name: "Vóley",
      color: const Color.fromRGBO(255, 245, 154, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/tenis.jpg",
      name: "Tenis",
      color: const Color.fromRGBO(149, 219, 95, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/rugby.jpg",
      name: "Rugby",
      color: const Color.fromRGBO(255, 90, 130, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/armar.jpg",
      name: "Artes marciales",
      color: const Color.fromRGBO(149, 149, 149, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/basket.jpg",
      name: "Basket",
      color: const Color.fromRGBO(236, 151, 73, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/handball.jpg",
      name: "Handball",
      color: const Color.fromRGBO(13, 207, 172, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/natacion.jpg",
      name: "Natación",
      color: const Color.fromRGBO(101, 199, 241, 0.4)),
  GridActivity(
      imagePath: "assets/images/card_images/otros.jpg",
      name: "Otros",
      color: const Color.fromRGBO(0, 102, 255, 0.4)),
];
