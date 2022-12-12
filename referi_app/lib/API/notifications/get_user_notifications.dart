import 'package:dio/dio.dart';

import '/API/params.dart';
import '/providers/app_providers.dart';
import '/models/dto/notification_dto.dart';

Future<List<DTONotification>?> getUserNotifications() async {
  Dio dio = Dio();

  String url = NotificationUrls.getNotificationsByUserId +
      AppProviders.userProviderDeaf.currentUser!.id;

  try {
    return await dio
        .get(url, options: Options(headers: getUserToken()))
        .then((value) {
      List<DTONotification> list = [];
      Map data = value.data as Map;
      for (var i = 0; i < data.length; i++) {
        list.add(DTONotification.fromJson(value.data["$i"]));
      }
      return list;
    });
  } on Exception {
    return null;
  }
}
