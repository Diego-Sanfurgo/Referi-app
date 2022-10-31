import 'dart:typed_data';

import 'package:referi_app/API/images/get_image.dart';

abstract class ImageHandler {
  static uploadImage(Uint8List image) async {
    await postImage(image.toString());
  }
}
