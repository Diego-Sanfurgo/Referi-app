import 'package:dio/dio.dart';
import 'package:referi_app/providers/app_providers.dart';

import '/API/params.dart';

Future<List?> getUserNotifications() async {
  Dio dio = Dio();

  String url = NotificationUrls.getNotificationsByUserId +
      AppProviders.userProviderDeaf.currentUser!.id;

  return await dio
      .get(url, options: Options(headers: getUserToken()))
      .then((value) {
    return value.data["data"];
  }).onError((error, stackTrace) => null);
}
