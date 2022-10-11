import 'package:flutter/material.dart';
import 'package:referi_app/providers/app_providers.dart';

import '../../utils/utils.dart' as util;

abstract class NavigationController {
  static void goTo(Routes route,
      {bool popPage = false, bool popUntil = false}) {
    if (popPage) {
      util.navigatorState?.popAndPushNamed(route.name);
    } else if (popUntil) {
      util.navigatorState?.popUntil(ModalRoute.withName(route.name));
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

  static void changeNavbarIndex(int value) =>
      AppProviders.navigationProviderDeaf.setNavbarIndex(value);
}

enum Routes {
  signin,
  signup_1,
  signup_2,
  signup_3,
  //homes
  home,
  accountHome,
  clubsHome,
  clubDetail,

  account,
  // institutions,
  credentialHome,
  credentialDetail,

  operationDetail,

  // activityHome,
  activitySearch,
  activityDetail,
  activityPayment,

  //Profile
  profile,
  personalData,
  personalDataEdit,

  notifications,

  //Scanner
  scanner,
}
