import 'package:dio/dio.dart';
import '../../API/params.dart';

Future<bool?> postAuth(String email, String password) async {
  Dio dio = Dio();

  Map body = {
    "email": email,
    "password": password,
  };

  return await dio.post(AuthUrls.postAuth, data: body).then((value) {
    if (value.statusCode == 201) {
      return true;
    }
  }).onError((error, stackTrace) => false);
}
