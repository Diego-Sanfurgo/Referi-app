import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/providers/app_providers.dart';

Future postVerify(String code) async {
  Dio dio = Dio();

  Map body = {
    "email": AppProviders.userProviderDeaf.userRegisterModel.email,
    "code": int.parse(code)
  };

  await dio.post(AuthUrls.postVerify, data: body).then((value) {
    return true;
  }).onError((error, stackTrace) {
    return false;
  }).timeout(const Duration(seconds: 40));
}
