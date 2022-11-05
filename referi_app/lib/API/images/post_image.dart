import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:referi_app/API/params.dart';

import '../../providers/app_providers.dart';

Future<bool> postImage(Uint8List imageBytes) async {
  Dio dio = Dio();
  String userId = AppProviders.userProviderDeaf.currentUser!.id;

  FormData body = FormData.fromMap({
    "file": MultipartFile.fromBytes(imageBytes,
        filename: "${userId}_profileImage.png")
  });
  // Map body = {"file":  imageBytes};

  return await dio
      .post(ImageUrls.postImage,
          data: body,
          options: Options(
            headers: getUserToken(),
            contentType: 'multipart/form-data',
          ))
      .then((value) {
    if (value.statusCode! >= 200 && value.statusCode! < 300) {
      return true;
    }
    return false;
  }).onError((error, stackTrace) {
    return false;
  }).timeout(const Duration(seconds: 30));
}
