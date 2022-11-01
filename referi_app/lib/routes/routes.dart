import 'package:flutter/material.dart';
import 'package:referi_app/views/account/account_home.dart';
import 'package:referi_app/views/activities/activity_detail.dart';
import 'package:referi_app/views/activities/activity_payment.dart';
import 'package:referi_app/views/activities/activity_payment_data.dart';
import 'package:referi_app/views/activities/activity_search.dart';
import 'package:referi_app/views/clubs/club_detail.dart';
import 'package:referi_app/views/clubs/clubs_home.dart';
import 'package:referi_app/views/credential/credential_home.dart';
import 'package:referi_app/views/credential/credential_detail.dart';
import 'package:referi_app/views/profile/personal_data_edit.dart';
import 'package:referi_app/views/scanner/scanner.dart';

import '../../views/home.dart';
import '../../views/notifications/notifications.dart';
import '../../views/profile/personal_data.dart';
import '../../views/profile/profile.dart';
import '../../views/signin/signin.dart';
import '../views/account/operation_detail.dart';
import '../views/signup/signup_1.dart';
import '../views/signup/signup_2.dart';
import '../../views/signup/verification_code.dart';

Map<String, WidgetBuilder> get routesMap => routes;

Map<String, WidgetBuilder> routes = {
  'home': (_) => const Home(),

  //SignIn and SignUp
  'signin': (_) => const SignIn(),
  'signup_1': (_) => const SignUpFirst(),
  'signup_2': (_) => const SignUpSecond(),
  'signup_3': (_) => const VerificationCode(),

  //Profile
  'profile': (_) => const Profile(),
  'personalData': (_) => const PersonalData(),
  'personalDataEdit': (_) => const PersonalDataEdit(),

  //Notifications
  'notifications': (_) => const Notifications(),

  //Activities
  'activitySearch': (_) => const ActivitySearch(),
  'activityDetail': (_) => const ActivityDetail(),
  'activityPayment': (_) => const ActivityPayment(),
  'activityPaymentData': (_) => const ActivityPaymentData(),

  //Account
  'accountHome': (_) => const AccountHome(),
  'operationDetail': (_) => const OperationDetail(),

  //Credential
  'credential': (_) => const CredentialHome(),
  'credentialDetail': (_) => const CredentialDetail(),

  //Clubs
  'clubHome': (_) => const ClubsHome(),
  'clubDetail': (_) => const ClubDetail(),

  //Scanner
  'scanner': (_) => const Scanner(),
};
