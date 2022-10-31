import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';

Future<bool> postImage(String imageString) async {
  Dio dio = Dio();

  return await dio
      .post(
    ImageUrls.getImage,
    options: Options(headers: getUserToken()),
    data: imageString,
  )
      .then((value) {
    if (value.statusCode! >= 200 && value.statusCode! < 300) {
      print(value.data);
      return true;
    }
    return false;
  }).onError((error, stackTrace) {
    return false;
  }).timeout(const Duration(seconds: 30));
}
