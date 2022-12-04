import 'package:referi_app/providers/app_providers.dart';

import '../../utils/utils.dart' as util;

abstract class NavigationController {
  static void goTo(Routes route,
      {bool popPage = false, bool popUntil = false}) {
    if (popPage) {
      util.navigatorState?.popAndPushNamed(route.name);
    } else if (popUntil) {
      util.navigatorState?.popUntil((route) => false);
      util.navigatorState?.pushNamed(route.name);
    } else {
      util.navigatorState?.pushNamed(route.name);
    }
  }

  static void goToWithArguments(Routes route,
      {bool popPage = false, required dynamic args}) {
    if (popPage) {
      util.navigatorState?.popAndPushNamed(route.name, arguments: args);
    } else {
      util.navigatorState?.pushNamed(route.name, arguments: args);
    }
  }

  static void pop() => util.navigatorState?.pop();

  static void changeNavbarIndex(int value) =>
      AppProviders.navigationProviderDeaf.setNavbarIndex(value);
}

enum Routes {
  //Auth
  login,
  signup_1,
  signup_2,
  signup_3,
  passwordRecover,

  //Clubs
  clubsHome,
  clubDetail,

  //Account
  accountHome,
  activityAccount,

  //Credential
  credentialHome,
  credentialDetail,

  operationDetail,

  // activityHome,
  home,
  activitySearch,
  activityDetail,
  activityDetailEnrolled,
  activityPayment,
  activityPaymentData,

  //Profile
  profile,
  personalData,
  personalDataEdit,

  //Notifications
  notifications,

  //Scanner
  scanner,

  //other
  successView,
}
