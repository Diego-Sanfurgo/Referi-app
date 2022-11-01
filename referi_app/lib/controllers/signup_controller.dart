import 'package:flutter/material.dart';
import 'package:referi_app/controllers/alert_controller.dart';

import '../../handlers/auth_handler.dart';
import '../../providers/app_providers.dart';

import 'navigation_controller.dart';
import 'user_controller.dart';

abstract class SignUpController {
  static checkFirstForm(GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    NavigationController.goTo(Routes.signup_2);
    UserController.getAndSaveProvinceAndCountry();
  }

  static checkSecondForm(GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();

    bool isOK = await AuthHandler.registerUser();
    if (!isOK) return;

    NavigationController.goTo(Routes.signup_3);
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
      return;
    }

    NavigationController.goTo(Routes.home, popUntil: true);
  }

  static login(GlobalKey<FormState> formKey) async {
    formKey.currentState?.save();
    Map<String, dynamic> user = AppProviders.userProviderDeaf.userRegister;

    bool isLogged =
        await AuthHandler.postLogin(user['email'], user['password']);

    if (!isLogged) return;

    NavigationController.goTo(Routes.home, popUntil: true);
  }
}
