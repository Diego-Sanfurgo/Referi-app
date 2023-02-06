import 'package:image_picker/image_picker.dart';

import '/handlers/user_handler.dart';
import '/handlers/image_handler.dart';
import '/controllers/navigation_controller.dart';

abstract class ImageController {
  static Future<XFile?> getImage(ImageSource source,
      {bool popContext = true}) async {
    ImagePicker imagePicker = ImagePicker();

    final XFile? image = await imagePicker
        .pickImage(source: source)
        .onError((error, stackTrace) async => null);

    if (image == null) return null;

    return image;
  }

  static uploadUserImage(XFile image) async {
    // Uint8List lightImage = await _compressImage(image);
    bool imageUploaded = await ImageHandler.uploadImage(image);

    if (!imageUploaded) {
      NavigationController.pop();
      return;
    }

    await UserHandler.updateUser();
    NavigationController.pop();
  }
}

// 4. compress Uint8List and get another Uint8List.
// Future<Uint8List> _compressImage(Uint8List list) async {
//   Uint8List result = await FlutterImageCompress.compressWithList(
//     list,
//     minHeight: 750,
//     minWidth: 750,
//     quality: 85,
//     format: CompressFormat.png,
//   );
//   return result;
// }
