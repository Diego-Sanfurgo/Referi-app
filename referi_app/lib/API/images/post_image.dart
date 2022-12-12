import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '/API/params.dart';
import '/providers/app_providers.dart';

Future<bool> postImage(Uint8List image) async {
  Dio dio = Dio();

  String userId = AppProviders.userProviderDeaf.currentUser!.id;

  final uri = Uri.parse(ImageUrls.postImage);
  // var request = http.MultipartRequest('POST', uri);
  // final httpImage = http.MultipartFile.fromBytes('files.myimage', image,
  //     filename: "${userId}_profile");
  // request.files.add(httpImage);

  // http.post(uri, body: httpImage, headers: getUserToken()).then((value) {
  //   print(value);
  // });

  // return true;

  // try {
  //   var response = await request.send();
  // } on Exception {}

  var file = MultipartFile.fromBytes(
    image,
    filename: "${userId}_profileImage.jpg",
  );

  FormData body = FormData.fromMap({
    "file": file,
    // "file": image.toString()
  });

  // var map = {"file": body};

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

  // return await dio
  //     .post(ImageUrls.postImage,
  //         data: body,
  //         options: Options(
  //           headers: getUserToken(),
  //           // contentType: 'multipart/form-data',
  //         ))
  //     .then((value) {
  //   AppProviders.userProviderDeaf.userRegisterModel.fotoPerfil =
  //       value.data['path'];
  //   return true;
  // }).onError((error, stackTrace) {
  //   return false;
  // }).timeout(const Duration(seconds: 60), onTimeout: () => false);
}
