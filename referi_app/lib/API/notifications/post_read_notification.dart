import 'package:dio/dio.dart';
import 'package:referi_app/API/params.dart';

Future<bool> postReadNotification(String notificationID) async {
  Dio dio = Dio();

  String url = NotificationUrls.postNotificationRead + notificationID;

  return await dio
      .post(url, options: Options(headers: getUserToken()))
      .then((value) {
    return true;
  }).onError((error, stackTrace) => false);
}
