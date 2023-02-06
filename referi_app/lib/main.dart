import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'providers/user_provider.dart';
import 'providers/navigation_provider.dart';

import '/routes/routes.dart';
import '/views/login/login.dart';
import "/utils/utils.dart" as util;
import "/theme/theme.dart" as theme;
import '/providers/activity_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ChangeNotifierProvider(create: (_) => ActivityProvider()),
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
