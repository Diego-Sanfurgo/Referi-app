import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:referi_app/views/home.dart';

import '../../routes/routes.dart';
import '../../views/signin/signin.dart';
import "../../theme/theme.dart" as theme;
import "../../utils/utils.dart" as util;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return MaterialApp(
        title: 'REFERÍ',
        theme: theme.theme,
        routes: routesMap,
        scaffoldMessengerKey: util.scaffoldKey,
        navigatorKey: util.navigatorKey,
        debugShowCheckedModeBanner: false,
        home: const Home(),
      );
    }));
  }
}
