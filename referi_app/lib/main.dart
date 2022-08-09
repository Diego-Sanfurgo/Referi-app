import 'package:flutter/material.dart';

import 'package:referi_app/views/home.dart';

import 'package:referi_app/routes/routes.dart';
import "package:referi_app/styles/theme.dart" as theme;
import 'package:referi_app/utils/utils.dart';
import 'package:referi_app/views/signin/signin.dart';
import 'package:sizer/sizer.dart';

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
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        home: const SignIn(),
      );
    }));
  }
}
