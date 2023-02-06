import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';
import 'package:referi_app/providers/app_providers.dart';

Future<bool> postAttendance(String url) async {
  Dio dio = Dio();

  Map body = {"id": AppProviders.userProviderDeaf.currentUser!.id};
  return await dio
      .post(url, options: Options(headers: getUserToken()), data: body)
      .then((value) {
    return true;
  }).onError((error, stackTrace) => false);
}
