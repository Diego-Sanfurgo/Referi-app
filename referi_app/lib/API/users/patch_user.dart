import 'package:dio/dio.dart';
import 'package:referi_app/models/user_register.dart';
import 'package:referi_app/providers/app_providers.dart';

import 'package:referi_app/API/params.dart';

import '../../models/user.dart';

Future<bool> patchUser() async {
  Dio dio = Dio();
  UserRegister user = AppProviders.userProviderDeaf.userRegisterModel;
  String url =
      UserUrls.patchUserById + AppProviders.userProviderDeaf.currentUser!.id;
  bool result = false;

  await dio
      .patch(
    url,
    data: user.toJson(),
    options: Options(headers: getUserToken()),
  )
      .then((value) {
    AppProviders.userProviderDeaf.setUser(User.fromJson(value.data["data"]));
    result = true;
    return;
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
