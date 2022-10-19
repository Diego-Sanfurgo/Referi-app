import 'package:dio/dio.dart';
import 'package:referi_app/models/user_register.dart';

import '../params.dart';

Future<bool?> postAuthRegister(UserRegister user) async {
  Dio dio = Dio();

  Map body = user.toJson();

  return await dio.post(AuthUrls.postAuthRegister, data: body).then((value) {
    int statusCode = value.statusCode as int;
    if (statusCode >= 201 && statusCode < 300) {
      return true;
    }
  }).onError((error, stackTrace) {
    return false;
  });
}
