import 'package:dio/dio.dart';
import 'package:referi_app/models/user_register.dart';

import '../params.dart';

Future<bool> postAuthRegister(UserRegister user) async {
  Dio dio = Dio();

  Map body = user.toJson();

  return await dio.post(AuthUrls.postRegister, data: body).then((value) {
    return true;
  }).onError((error, stackTrace) {
    return false;
  });
}
