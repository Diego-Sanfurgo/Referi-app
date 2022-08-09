import 'package:flutter/material.dart';
import 'package:referi_app/views/home.dart';
import 'package:referi_app/views/signin/signin.dart';
import 'package:referi_app/views/signup/signup_first.dart';
import 'package:referi_app/views/signup/signup_second.dart';
import 'package:referi_app/views/signup/verification_code.dart';

Map<String, WidgetBuilder> get routesMap => routes;

Map<String, WidgetBuilder> routes = {
  'home': (_) => const Home(),
  'signin': (_) => const SignIn(),
  'signup_1': (_) => const SignUpFirst(),
  'signup_2': (_) => const SignUpSecond(),
  'signup_3': (_) => const VerificationCode(),

  //
};
