import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

NavigatorState? get navigatorState => navigatorKey.currentState;

BuildContext get actualContext => scaffoldKey.currentContext as BuildContext;
