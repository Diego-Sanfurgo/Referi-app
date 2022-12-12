import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

NavigatorState? get navigatorState => navigatorKey.currentState;

BuildContext get navigatorContext =>
    navigatorKey.currentState?.context as BuildContext;

BuildContext get actualContext => scaffoldKey.currentContext as BuildContext;

String removeAccentsToLowerCase(String value) {
  String auxVal = value
      .toLowerCase()
      .replaceAll(RegExp(r'á'), 'a')
      .replaceAll(RegExp(r'é'), 'e')
      .replaceAll(RegExp(r'í'), 'i')
      .replaceAll(RegExp(r'ó'), 'o')
      .replaceAll(RegExp(r'ú'), 'u');
  if (auxVal == "correo electronico") {
    auxVal = "email";
  }
  return auxVal;
}
