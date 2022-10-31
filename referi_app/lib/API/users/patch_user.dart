import 'package:dio/dio.dart';
import 'package:referi_app/models/user_register.dart';
import 'package:referi_app/providers/app_providers.dart';

import 'package:referi_app/API/params.dart';

Future<bool> patchUser(UserRegister user) async {
  Dio dio = Dio();
  String url =
      UserUrls.patchUserById + AppProviders.userProviderDeaf.currentUser.id;
  bool result = false;

  await dio
      .patch(
    url,
    data: user.toJson(),
    options: Options(headers: getUserToken()),
  )
      .then((value) {
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
