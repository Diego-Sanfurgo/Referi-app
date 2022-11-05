import 'package:flutter/material.dart';
import 'package:referi_app/views/login/login.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'providers/user_provider.dart';
import 'providers/navigation_provider.dart';

import '../../routes/routes.dart';
// import '../../views/signin/signin.dart';
import "../../utils/utils.dart" as util;
import "../../theme/theme.dart" as theme;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => NavigationProvider()),
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
        title: 'Referi',
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
        // home: const Home(),
        home: const Login(),
      );
    }));
  }
}
