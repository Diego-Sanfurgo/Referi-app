import 'package:dio/dio.dart';

import '/API/params.dart';
import '/providers/app_providers.dart';
import '/models/dto/notification_dto.dart';

Future<List<DTONotification>> getUserNotifications() async {
  Dio dio = Dio();

  String url = NotificationUrls.getNotificationsByUserId +
      AppProviders.userProviderDeaf.currentUser!.id;

  try {
    final response = await dio.get(url, options: Options(headers: getUserToken()));
    final List<dynamic> notifications = response.data['data'] ?? [];

    return notifications.map((item) {
      DTONotification dto = DTONotification.fromJson(item['notificacion']);
      dto.parentId = item['id'];
      dto.read = item['fechaLectura'] != null;
      return dto;
    }).toList();
  } catch (_) {
    return [];
  }
}
