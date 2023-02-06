import 'dart:typed_data';

import 'package:dio/dio.dart';

import '/API/params.dart';
import '/providers/app_providers.dart';

Future<bool> postImage(Uint8List image) async {
  Dio dio = Dio();

  String userId = AppProviders.userProviderDeaf.currentUser!.id;

  final uri = Uri.parse(ImageUrls.postImage);

  var file = MultipartFile.fromBytes(
    image,
    filename: "${userId}_profileImage.jpg",
  );

  FormData body = FormData.fromMap({
    "file": file,
  });

  return await dio
      .postUri(uri,
          data: body,
          options: Options(
              headers: getUserToken(), contentType: "multipart/form-data"))
      .then((value) {
    AppProviders.userProviderDeaf.userRegisterModel.fotoPerfil =
        value.data['path'];
    return true;
  }).onError((error, stackTrace) {
    return false;
  });
}
