import 'package:flutter/material.dart';

import 'dart:convert';

GridActivity gridActivityFromJson(String str) =>
    GridActivity.fromJson(json.decode(str));

String gridActivityToJson(GridActivity data) => json.encode(data.toJson());

class GridActivity {
  GridActivity({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.color,
  });

  final String id;
  final String imageUrl;
  final String name;
  final Color color;

  factory GridActivity.fromJson(Map<String, dynamic> json) => GridActivity(
        id: json['id'],
        imageUrl: json["imageUrl"],
        name: json["name"],
        color: _getActivityColor(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imageUrl": imageUrl,
        "name": name,
        // "color": color,
      };
}

Color _getActivityColor(String activityName) {
  switch (activityName) {
    case 'Fútbol':
      return const Color.fromRGBO(253, 254, 255, 0.4);
    case 'Gimnasio':
      return const Color.fromRGBO(171, 108, 252, 0.4);
    case 'Danza':
      return const Color.fromRGBO(230, 147, 237, 0.4);
    case 'Vóley':
      return const Color.fromRGBO(255, 245, 154, 0.4);
    case 'Tenis':
      return const Color.fromRGBO(149, 219, 95, 0.4);
    case 'Rugby':
      return const Color.fromRGBO(255, 90, 130, 0.4);
    case 'Artes marciales':
      return const Color.fromRGBO(149, 149, 149, 0.4);
    case 'Basket':
      return const Color.fromRGBO(236, 151, 73, 0.4);
    case 'Handball':
      return const Color.fromRGBO(13, 207, 172, 0.4);
    case 'Natación':
      return const Color.fromRGBO(101, 199, 241, 0.4);
    case 'Otros':
      return const Color.fromRGBO(0, 102, 255, 0.4);
    default:
      return const Color.fromRGBO(0, 102, 255, 0.4);
  }
}

List<GridActivity> gridActivities = [
  // GridActivity(
  //     imageUrl: "assets/images/card_images/futbol.jpg",
  //     name: "Fútbol",
  //     color: const Color.fromRGBO(253, 254, 255, 0.4)),
  GridActivity(
      id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
      imageUrl: "assets/images/card_images/gim.jpg",
      name: "Gimnasio",
      color: const Color.fromRGBO(171, 108, 252, 0.4)),
  GridActivity(
      id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
      imageUrl: "assets/images/card_images/danza.jpg",
      name: "Danza",
      color: const Color.fromRGBO(230, 147, 237, 0.4)),
  GridActivity(
      id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
      imageUrl: "assets/images/card_images/voley.jpg",
      name: "Vóley",
      color: const Color.fromRGBO(255, 245, 154, 0.4)),
  GridActivity(
      id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
      imageUrl: "assets/images/card_images/tenis.jpg",
      name: "Tenis",
      color: const Color.fromRGBO(149, 219, 95, 0.4)),
  GridActivity(
      id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
      imageUrl: "assets/images/card_images/rugby.jpg",
      name: "Rugby",
      color: const Color.fromRGBO(255, 90, 130, 0.4)),
  GridActivity(
      id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
      imageUrl: "assets/images/card_images/armar.jpg",
      name: "Artes marciales",
      color: const Color.fromRGBO(149, 149, 149, 0.4)),
  // GridActivity(
  //   // id: "5616e318-83b3-42ae-b438-0bd86dab7592",
  //   imageUrl: "assets/images/card_images/basket.jpg",
  //   name: "Basket",
  //   color: const Color.fromRGBO(236, 151, 73, 0.4),
  // ),
  GridActivity(
      id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
      imageUrl: "assets/images/card_images/handball.jpg",
      name: "Handball",
      color: const Color.fromRGBO(13, 207, 172, 0.4)),
  GridActivity(
      id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
      imageUrl: "assets/images/card_images/natacion.jpg",
      name: "Natación",
      color: const Color.fromRGBO(101, 199, 241, 0.4)),
  GridActivity(
      id: "be6ec229-e5be-4fe4-a117-9166bd2a0b54",
      imageUrl: "assets/images/card_images/otros.jpg",
      name: "Otros",
      color: const Color.fromRGBO(0, 102, 255, 0.4)),
];
