import 'package:dio/dio.dart';
import 'package:referi_app/models/user.dart';
import 'package:referi_app/providers/app_providers.dart';
import '../../API/params.dart';

Future<bool> postAuthLogin(String email, String password) async {
  Dio dio = Dio();

  Map body = {
    "email": email,
    "password": password,
  };

  return await dio.post(AuthUrls.postAuthLogin, data: body).then((value) {
    if (value.statusCode == 200) {
      UserModel registeredUser = UserModel.fromJson(value.data['data']);
      AppProviders.userProviderDeaf.setUser(registeredUser);
      return true;
    }
    return false;
  }).onError((error, stackTrace) {
    print(error);
    return false;
  });
}
