import 'package:image_picker/image_picker.dart';

import '/API/images/post_image.dart';
import '../controllers/general_alert_controller.dart';
import '/controllers/navigation_controller.dart';

abstract class ImageHandler {
  static Future<bool> uploadImage(XFile image) async {
    GeneralAlert.showLoading();
    bool isOK = await postImage(image);
    NavigationController.pop();
    return isOK;
  }
}
