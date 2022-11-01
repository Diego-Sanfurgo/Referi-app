import 'dart:typed_data';

import 'package:referi_app/controllers/alert_controller.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

import '../API/images/post_image.dart';

abstract class ImageHandler {
  static Future<bool> uploadImage(Uint8List image) async {
    Alert.showLoading();
    bool isOK = await postImage(image);
    NavigationController.pop();

    if (!isOK) {
      await Alert.showError(
          "Ocurrió un error al cargar la imágen. Intentalo de nuevo más tarde.");
      return false;
    }
    return true;
  }
}
