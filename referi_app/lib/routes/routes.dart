import 'package:flutter/material.dart';
import 'package:referi_app/views/activities/activity_detail.dart';
import 'package:referi_app/views/activities/activity_search.dart';

import '../../views/home.dart';
import '../../views/notifications/notifications.dart';
import '../../views/profile/personal_data.dart';
import '../../views/profile/profile.dart';
import '../../views/signin/signin.dart';
import '../../views/signup/signup_first.dart';
import '../../views/signup/signup_second.dart';
import '../../views/signup/verification_code.dart';

Map<String, WidgetBuilder> get routesMap => routes;

Map<String, WidgetBuilder> routes = {
  'home': (_) => const Home(),
  'signin': (_) => const SignIn(),
  'signup_1': (_) => const SignUpFirst(),
  'signup_2': (_) => const SignUpSecond(),
  'signup_3': (_) => const VerificationCode(),

  //Profile
  'profile': (_) => const Profile(),
  'personalData': (_) => const PersonalData(),

  //Notifications
  'notifications': (_) => const Notifications(),

  //Activities
  'activitySearch': (_) => const ActivitySearch(),
  'activityDetail': (_) => const ActivityDetail(),

  //
};
