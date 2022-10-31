import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:referi_app/handlers/user_handler.dart';

import '../../controllers/image_controller.dart';
import '../../models/user_register.dart';
import '../../providers/app_providers.dart';

import '../handlers/location_handler.dart';
import '../models/local_geolocation.dart';

abstract class UserController {
  static updateUser(UserRegister user) async {
    // GlobalKey<FormState> globalKey = formKey as GlobalKey<FormState>;
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }
    // formKey.currentState!.save();
    await UserHandler.updateUser(user);
  }

  static setFormValidationValue(bool? value) {
    if (value == null) return;

    AppProviders.userProviderDeaf.setFormValidation(value);
  }

  static captureImage(bool fromCamera) async {
    Uint8List? bytesImage = fromCamera
        ? await ImageController.getImage(ImageSource.camera)
        : await ImageController.getImage(ImageSource.gallery);

    if (bytesImage == null) {
      //Alert.Error
      return;
    }

    ImageController.uploadUserImage(bytesImage);
  }

  static addValueToUser(String value, String label) =>
      AppProviders.userProviderDeaf.addValueToUserRegister(value, label);

  static getAndSaveProvinceAndCountry() async {
    LocalGeolocation? actualLocation = await LocationHandler.getLocal();
    if (actualLocation == null) return;

    String dpto = actualLocation.ubicacion.departamento.nombre!;
    String prov = actualLocation.ubicacion.provincia.nombre!;
    addValueToUser(dpto, 'ciudad');
    addValueToUser(prov, 'provincia');
  }
}
