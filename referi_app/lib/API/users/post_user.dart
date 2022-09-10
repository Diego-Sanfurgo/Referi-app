import 'package:dio/dio.dart';

import '../params.dart';

import '../../models/user.dart';

Future<dynamic> postUser(User user) async {
  Dio dio = Dio();

  Map body = user.toJson();

  return await dio.post(UsersUrls.postUser, data: body).then((value) {
    if (value.statusCode == 201) {
      return true;
    }
  }).onError((error, stackTrace) => null);
}
