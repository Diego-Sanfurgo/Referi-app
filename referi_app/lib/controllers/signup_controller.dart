import 'package:flutter/material.dart';

import '../../handlers/auth_handler.dart';
import '../../handlers/location_handler.dart';
import '../../models/local_geolocation.dart';
import '../../providers/app_providers.dart';

import 'navigation_controller.dart';

abstract class SignUpController {
  static checkSignUpForm(GlobalKey<FormState> formKey, int progressValue) {
    if (!formKey.currentState!.validate()) return;

    AppProviders.userProviderDeaf.setProgressBarValue(true, progressValue);
    if (progressValue == 1) {
      NavigationController.goTo(Routes.signup_2);
      getAndSaveProvinceAndCountry();
    } else {
      NavigationController.goTo(Routes.signup_3);
    }

    formKey.currentState?.save();
    AppProviders.userProviderDeaf.setFormValidation(false);
  }

  static saveValue(String value, String label) =>
      AppProviders.userProviderDeaf.addValueToUserRegister(value, label);

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

  static getAndSaveProvinceAndCountry() async {
    LocalGeolocation? actualLocation = await LocationHandler.getLocal();
    if (actualLocation == null) return;

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
