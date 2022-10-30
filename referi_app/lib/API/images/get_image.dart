import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';

Future<bool> postImage(String imageString) async {
  Dio dio = Dio();

  return await dio
      .get(ImageUrls.getImage )
      .then((value) {
        if (value.statusCode! >= 200 && value.statusCode! < 300) {
          return true;
        }
        return false;
      })
      .onError((error, stackTrace) => false)
      .timeout(const Duration(seconds: 30));
}
