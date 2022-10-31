import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

NavigatorState? get navigatorState => navigatorKey.currentState;

BuildContext get actualContext => scaffoldKey.currentContext as BuildContext;

String removeAccentsToLowerCase(String value) {
  String auxVal = value.toLowerCase();
  auxVal.replaceAll(r'á', 'a');
  auxVal.replaceAll(r'é', 'e');
  auxVal.replaceAll(r'í', 'i');
  auxVal.replaceAll(r'ó', 'o');
  auxVal.replaceAll(r'ú', 'u');
  return auxVal;
}

// 4. compress Uint8List and get another Uint8List.
Future<Uint8List> compressImage(Uint8List list) async {
  Uint8List result = await FlutterImageCompress.compressWithList(
    list,
    minHeight: 750,
    minWidth: 750,
    quality: 85,
    format: CompressFormat.png,
  );
  return result;
}
