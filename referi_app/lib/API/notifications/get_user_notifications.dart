import 'package:dio/dio.dart';

import '/API/params.dart';
import '/providers/app_providers.dart';
import '/models/dto/notification_dto.dart';

Future<List<DTONotification>> getUserNotifications() async {
  Dio dio = Dio();

  String url = NotificationUrls.getNotificationsByUserId +
      AppProviders.userProviderDeaf.currentUserId;

  try {
    return await dio
        .get(url, options: Options(headers: getUserToken()))
        .then((value) {
      List<DTONotification> list = [];
      Map data = value.data as Map;
      for (var i = 0; i < data.length; i++) {
        DTONotification dto =
            DTONotification.fromJson(value.data["$i"]['notificacion']);
        dto.parentId = value.data['$i']['id'];
        if (value.data['$i']['fechaLectura'] != null) {
          dto.read = true;
        }
        list.add(dto);
      }
      return list;
    });
  } on Exception {
    return [];
  }
}
