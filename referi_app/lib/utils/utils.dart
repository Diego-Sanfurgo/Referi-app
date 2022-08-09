import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

BuildContext get actualContext =>
    rootScaffoldMessengerKey.currentContext as BuildContext;
