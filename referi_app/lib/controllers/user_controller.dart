import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:referi_app/controllers/image_controller.dart';
import 'package:referi_app/models/user.dart';
import 'package:referi_app/providers/app_providers.dart';

abstract class UserController {
  static updateUser(User user) {}

  static setFormValidationValue(bool? value) {
    if (value == null) return;

    AppProviders.userProviderDeaf.setFormValidation(value);
  }

  static captureImage(bool fromCamera) async {
    Uint8List? bytesImage = fromCamera
        ? await ImageController.getImage(ImageSource.camera)
        : await ImageController.getImage(ImageSource.gallery);

        if(bytesImage == null){
          //Alert.Error
          return;
        }

        
  }
}
