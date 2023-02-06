import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import '/models/enrollment.dart';
import '/utils/utils.dart' as util;
import '/handlers/user_handler.dart';
import '/providers/app_providers.dart';
import '/models/local_geolocation.dart';
import '/handlers/location_handler.dart';
import '/controllers/image_controller.dart';
import '/controllers/navigation_controller.dart';

abstract class UserController {
  static updateUser(GlobalKey<FormState> formKey) async {
    formKey.currentState!.save();
    bool isOK = await UserHandler.updateUser();
    if (!isOK) return;
    NavigationController.pop();
  }

  static captureImage(bool fromCamera) async {
    XFile? bytesImage = fromCamera
        ? await ImageController.getImage(ImageSource.camera)
        : await ImageController.getImage(ImageSource.gallery);

    if (bytesImage == null) return;

    ImageController.uploadUserImage(bytesImage);
  }

  static addValueToUser(String value, String label) {
    String formattedLabel = util.removeAccentsToLowerCase(label);
    AppProviders.userProviderDeaf.addValueToUserRegister(value, formattedLabel);
  }

  static getAndSaveProvinceAndCountry() async {
    LocalGeolocation? actualLocation = await LocationHandler.getLocal();
    if (actualLocation == null) return;

    String dpto = actualLocation.ubicacion.departamento.nombre!;
    String prov = actualLocation.ubicacion.provincia.nombre!;
    addValueToUser(dpto, 'ciudad');
    addValueToUser(prov, 'provincia');
  }

  static Future<List<Enrollment>> obtainUserActivities() async {
    return await UserHandler.obtainerUserEnrollments();
  }
}
