import 'dart:developer';

import 'package:dio/dio.dart';
import '../../API/params.dart';

Future<bool?> postAuthLogin(String email, String password) async {
  Dio dio = Dio();

  Map body = {
    "email": email,
    "password": password,
  };

  return await dio.post(AuthUrls.postAuthLogin, data: body).then((value) {
    if (value.statusCode == 200) {
      print(value.data);
      return true;
    }
    return false;
  }).onError((error, stackTrace) => false);
}
