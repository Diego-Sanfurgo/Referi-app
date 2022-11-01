import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import '../../handlers/image_handler.dart';

abstract class ImageController {
  static Future<Uint8List?> getImage(ImageSource source,
      {bool popContext = true}) async {
    // UtilsProvider provider = Provider.of<UtilsProvider>(context, listen: false);
    ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker
        .pickImage(source: source)
        .onError((error, stackTrace) async {
      return null;
    });

    if (image == null) return null;

    Uint8List imageContent = await image.readAsBytes();
    return imageContent;
  }

  static uploadUserImage(Uint8List image) async {
    Uint8List lightImage = await _compressImage(image);
    await ImageHandler.uploadImage(lightImage);
  }
}

// 4. compress Uint8List and get another Uint8List.
Future<Uint8List> _compressImage(Uint8List list) async {
  Uint8List result = await FlutterImageCompress.compressWithList(
    list,
    minHeight: 750,
    minWidth: 750,
    quality: 85,
    format: CompressFormat.png,
  );
  return result;
}
