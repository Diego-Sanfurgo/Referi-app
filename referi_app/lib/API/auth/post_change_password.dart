import 'package:dio/dio.dart';

import '/API/params.dart';
import '/providers/app_providers.dart';

Future<bool> postChangePassword(String oldPsw, String newPsw) async {
  Dio dio = Dio();

  Map body = {
    "id": AppProviders.userProviderDeaf.currentUser!.id,
    "oldPassword": oldPsw,
    "newPassword": newPsw,
  };

  return await dio
      .post(AuthUrls.postChangePassword,
          data: body, options: Options(headers: getUserToken()))
      .then((value) {
    return true;
  }).onError((error, stackTrace) {
    return false;
  });
}
