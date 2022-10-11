import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referi_app/handlers/auth_handler.dart';
import 'package:referi_app/handlers/location_handler.dart';
import 'package:referi_app/models/local_geolocation.dart';
import 'package:referi_app/providers/app_providers.dart';

import '../../providers/user_provider.dart';

import 'navigation_controller.dart';
import '../../utils/utils.dart' as util;

abstract class SignUpController {
  static checkSignUpForm(GlobalKey<FormState> formKey, int progressValue) {
    if (!formKey.currentState!.validate()) {
      return;
    }

    Provider.of<UserProvider>(util.actualContext, listen: false)
        .setProgressBarValue(true, progressValue);
    if (progressValue == 1) {
      NavigationController.goTo(Routes.signup_2);
      getAndSaveProvinceAndCountry();
    } else {
      NavigationController.goTo(Routes.signup_3, popPage: true);
    }

    formKey.currentState?.save();
  }

  static saveValue(String value, String label) {
    Provider.of<UserProvider>(util.actualContext, listen: false)
        .addValueToUserRegister(value, label);
  }

  static comparePasswords(String value) {
    String psw = Provider.of<UserProvider>(util.actualContext, listen: false)
        .userRegister['password'];

    if (value != psw) {
      return "Las contraseñas no son iguales.";
    }

    return null;
  }

  static saveRegisteringUser() async {
    bool isRegistered = await AuthHandler.registerUser();
    if (!isRegistered) {
      NavigationController.goTo(Routes.signin, popPage: true);
      return;
    }

    NavigationController.goTo(Routes.home, popUntil: true);
  }

  static getAndSaveProvinceAndCountry() async {
    LocalGeolocation? actualLocation = await LocationHandler.getLocal();
    if (actualLocation == null) {
      return;
    }
    String dpto = actualLocation.ubicacion.departamento.nombre!;
    String prov = actualLocation.ubicacion.provincia.nombre!;
    saveValue(dpto, 'ciudad');
    saveValue(prov, 'provincia');
  }

  static login(GlobalKey<FormState> formKey) async {
    formKey.currentState?.save();

    Map<String, dynamic> user = AppProviders.userProviderDeaf.userRegister;

    bool isLogged =
        await AuthHandler.postLogin(user['email'], user['password']);

    if (!isLogged) return;

    NavigationController.goTo(Routes.home, popPage: true);
  }
}
