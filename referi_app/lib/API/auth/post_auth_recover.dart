import "package:dio/dio.dart";
import 'package:referi_app/API/params.dart';

Future<bool> postAuthRecover(String email) async {
  Dio dio = Dio();

  Map body = {"email": email};

  return await dio.post(AuthUrls.postRecover, data: body).then((value) {
    return true;
  }).onError((error, stackTrace) {
    return false;
  });
}
