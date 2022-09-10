import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sizer/sizer.dart';
import 'package:referi_app/views/home.dart';

import '../../routes/routes.dart';
import '../../views/signin/signin.dart';
import "../../styles/theme.dart" as theme;
import "../../utils/utils.dart" as util;
import 'providers/user_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<UserProvider>(create: (_) => UserProvider()),
    ],
    child: const ReferiApp(),
  ));
}

class ReferiApp extends StatelessWidget {
  const ReferiApp({Key? key}) : super(key: key);

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
        home: const SignIn(),
      );
    }));
  }
}
