import 'package:flutter/material.dart';
import 'package:referi_app/controllers/alert_controller.dart';

import '../../handlers/auth_handler.dart';
import '../../providers/app_providers.dart';

import 'navigation_controller.dart';
import 'user_controller.dart';

abstract class SignUpController {
  static checkSignUpForm(GlobalKey<FormState> formKey, int progressValue) {
    if (!formKey.currentState!.validate()) return;

    AppProviders.userProviderDeaf.setProgressBarValue(true, progressValue);
    if (progressValue == 1) {
      NavigationController.goTo(Routes.signup_2);
      UserController.getAndSaveProvinceAndCountry();
    } else {
      NavigationController.goTo(Routes.signup_3);
    }

    formKey.currentState?.save();
    AppProviders.userProviderDeaf.setFormValidation(false);
  }

  static comparePasswords(String value) {
    String psw = AppProviders.userProviderDeaf.userRegister['password'];

    if (value != psw) {
      return "Las contraseñas no son iguales.";
    }

    return null;
  }

  static saveRegisteringUser() async {
    bool isRegistered = await AuthHandler.registerUser();
    if (!isRegistered) {
      // NavigationController.goTo(Routes.signin, popPage: true);
      return;
    }

    NavigationController.goTo(Routes.home, popUntil: true);
  }

  static login(GlobalKey<FormState> formKey) async {
    formKey.currentState?.save();
    Map<String, dynamic> user = AppProviders.userProviderDeaf.userRegister;

    Alert.showLoading();
    bool isLogged =
        await AuthHandler.postLogin(user['email'], user['password']);

    if (!isLogged) {
      NavigationController.pop();
      return;
    }

    NavigationController.goTo(Routes.home, popUntil: true);
  }
}
