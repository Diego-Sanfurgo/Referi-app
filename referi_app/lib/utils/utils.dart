import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

NavigatorState? get navigatorState => navigatorKey.currentState;

BuildContext get actualContext => scaffoldKey.currentContext as BuildContext;

String removeAccentsToLowerCase(String value) {
  String auxVal = value
      .toLowerCase()
      .replaceAll(RegExp(r'á'), 'a')
      .replaceAll(RegExp(r'é'), 'e')
      .replaceAll(RegExp(r'í'), 'i')
      .replaceAll(RegExp(r'ó'), 'o')
      .replaceAll(RegExp(r'ú'), 'u');
  return auxVal;
}
