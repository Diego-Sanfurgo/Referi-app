import 'package:dio/dio.dart';

import '../params.dart';

import '../../models/user.dart';

Future<bool?> postAuthRegister(User user) async {
  Dio dio = Dio();

  Map body = user.toJson();

  return await dio.post(AuthUrls.postAuthRegister, data: body).then((value) {
    if (value.statusCode == 201) {
      return true;
    }
  }).onError((error, stackTrace) => false);
}
