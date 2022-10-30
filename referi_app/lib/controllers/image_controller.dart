import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

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
    
    // String imageContentString = imageContent.toString();

    // provider.setImageContentString(imageContentString);
    // provider.setImageContent(imageContent);
    if (popContext) {
      NavigationController.pop();
    }
  }
}
