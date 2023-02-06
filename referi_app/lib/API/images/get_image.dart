import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';

Future<bool> getImage(String imageString) async {
  Dio dio = Dio();

  return await dio
      .get(
    ImageUrls.getImage,
    options: Options(headers: getUserToken()),
  )
      .then((value) {
    print(value.data);
    return true;
  }).onError((error, stackTrace) {
    return false;
  }).timeout(const Duration(seconds: 30));
}
