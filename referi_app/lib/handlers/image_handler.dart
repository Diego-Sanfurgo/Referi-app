import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import '/API/images/post_image.dart';
import '/controllers/alert_controller.dart';
import '/controllers/navigation_controller.dart';

abstract class ImageHandler {
  static Future<bool> uploadImage(XFile image) async {
    Alert.showLoading();
    StreamedResponse isOK = await postImage(image);
    NavigationController.pop();
    return true;
  }
}
