import 'package:dio/dio.dart';

import '/API/params.dart';
import '/models/user.dart';
import '/providers/app_providers.dart';

Future<bool> postAuthLogin(String email, String password) async {
  Dio dio = Dio();

  Map body = {
    "email": email,
    "password": password,
  };

  return await dio.post(AuthUrls.postLogin, data: body).then((value) {
    UserModel registeredUser = UserModel.fromJson(value.data['data']);
    AppProviders.userProviderDeaf.setUserModel(registeredUser);
    return true;
  }).onError((error, stackTrace) {
    return false;
  });
}
