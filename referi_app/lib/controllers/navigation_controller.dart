import 'package:flutter/material.dart';

// import 'package:referi_app/utils/utils.dart' as utils;

abstract class NavigationController {
  static void goTo(BuildContext context, {required Routes route, bool popPage = false, bool popUntil = false}) {
    // BuildContext context = utils.actualContext;

    if (popPage) {
      Navigator.popAndPushNamed(context, route.name);
    } else if (popUntil) {
      Navigator.popUntil(context, ModalRoute.withName(route.name));
    } else {
      Navigator.pushNamed(context, route.name);
    }
  }
}

enum Routes {
  signin,
  signup_1,
  signup_2,
  signup_3,
  home,
  // account,
  // institutions,
  // credential,
  // activitySearch,
  // activityDetail,
  // activityPayment,
  // profile,
  // personalData,
  // notifications,
  // operationDetail
}
