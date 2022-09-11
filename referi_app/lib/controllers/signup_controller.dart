import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referi_app/providers/user_provider.dart';

import 'navigation_controller.dart';
import 'package:referi_app/utils/utils.dart' as util;

abstract class SignUpController {
  static checkFirstForm(GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    // formKey.currentState?.save();
    Provider.of<UserProvider>(util.actualContext, listen: false)
        .setProgressBarValue(true, 1);
    NavigationController.goTo(Routes.signup_2);
  }

  static checkSecondForm(GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    Provider.of<UserProvider>(util.actualContext, listen: false)
        .setProgressBarValue(true, 2);
    NavigationController.goTo(Routes.signup_3, popPage: true);
  }

  static saveValue(String value, String label) {
    Provider.of<UserProvider>(util.actualContext, listen: false)
        .addValueToUserRegister(value, label);
  }

  static saveRegisteringUser() {
    Provider.of<UserProvider>(util.actualContext, listen: false).userRegister;
  }
}
