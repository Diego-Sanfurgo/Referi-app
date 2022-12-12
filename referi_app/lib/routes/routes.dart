import 'package:flutter/material.dart';

import '/views/home.dart';
import '/views/login/login.dart';
import '/views/signup/signup_1.dart';
import '/views/signup/signup_2.dart';
import '../views/profile/home/profile.dart';
import '/views/scanner/scanner.dart';
import '/theme/animations/success_view.dart';
import '/views/signup/verification_code.dart';
import '/views/profile/personal_data_edit.dart';
import '/views/notifications/notifications.dart';
import '/views/activities/activity_payment.dart';
import '/views/credential/credential_detail.dart';
import '../views/clubs/clubs home/clubs_home.dart';
import '../views/clubs/club detail/club_detail.dart';
import '/views/password%20recover/pass_recover.dart';
import '/views/activities/activity_payment_data.dart';
import '/views/account/account_home/account_home.dart';
import '../views/profile/personal data/personal_data.dart';
import '/views/account/activity_account/activity_account.dart';
import '/views/account/operation_detail/operation_detail.dart';
import '/views/activities/activity_search/activity_search.dart';
import '../views/credential/credential home/credential_home.dart';
import '../views/activities/activity detail/activity_detail.dart';
import '../views/activities/activity detail enrolled/activity_detail_enrolled.dart';

Map<String, WidgetBuilder> get routesMap => routes;

Map<String, WidgetBuilder> routes = {
  'home': (_) => const Home(),

  //Auth
  'login': (_) => const Login(),
  'signup_1': (_) => const SignUpFirst(),
  'signup_2': (_) => const SignUpSecond(),
  'signup_3': (_) => const VerificationCode(),
  'passwordRecover': (_) => const PassRecover(),

  //Profile
  'profile': (_) => const Profile(),
  'personalData': (_) => const PersonalData(),
  'personalDataEdit': (_) => const PersonalDataEdit(),

  //Notifications
  'notifications': (_) => const Notifications(),

  //Activities
  'activitySearch': (_) => const ActivitySearch(),
  'activityDetail': (_) => const ActivityDetail(),
  'activityDetailEnrolled': (_) => const ActivityDetailEnrolled(),
  'activityPayment': (_) => const ActivityPayment(),
  'activityPaymentData': (_) => const ActivityPaymentData(),

  //Account
  'accountHome': (_) => const AccountHome(),
  'operationDetail': (_) => const OperationDetail(),
  'activityAccount': (_) => const ActivityAccount(),

  //Credential
  'credential': (_) => const CredentialHome(),
  'credentialDetail': (_) => const CredentialDetail(),

  //Clubs
  'clubHome': (_) => const ClubsHome(),
  'clubDetail': (_) => const ClubDetail(),

  //Scanner
  'scanner': (_) => const Scanner(),

  //Other
  'successView': (_) => const SuccessView(),
};
