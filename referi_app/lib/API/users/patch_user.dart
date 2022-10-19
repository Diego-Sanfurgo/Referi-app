import 'package:dio/dio.dart';

import '../../models/user.dart';

import 'package:referi_app/API/params.dart';

Future<bool> patchUser(User user) async {
  Dio dio = Dio();
  String url = UserUrls.patchUserById + user.id;
  bool result = false;

  await dio.patch(url, data: user.toJson()).then((value) {
    if (value.statusCode == 200) {
      result = true;
      return;
    }
    result = false;
  }).onError((error, stackTrace) {
    result = false;
  }).timeout(
    const Duration(seconds: 40),
    onTimeout: () {
      result = false;
    },
  );

  return result;
}
