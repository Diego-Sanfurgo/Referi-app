import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import 'providers/user_provider.dart';

import '../../views/home.dart';
import '../../routes/routes.dart';
import '../../views/signin/signin.dart';
import "../../styles/theme.dart" as theme;
import "../../utils/utils.dart" as util;

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
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', ''), Locale('es', 'ES')],
        home: const SignIn(),
      );
    }));
  }
}
