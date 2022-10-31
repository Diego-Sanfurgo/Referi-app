import 'dart:typed_data';

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
    await ImageHandler.uploadImage(image);
  }
}
