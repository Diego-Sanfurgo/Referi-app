import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/providers/app_providers.dart';
import '/models/dto/notification_dto.dart';
import '/API/notifications/get_user_notifications.dart';
import '/API/notifications/post_read_notification.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationBloc() : super(NotificationsInitial()) {
    on<FetchNotifications>((event, emit) async {
      _notifications = await getUserNotifications();

      if (_notifications.isEmpty) {
        emit(NoNotificationsFound());
        return;
      }

      int unread =
          _notifications.where((element) => element.read == false).length;

      AppProviders.navigationProviderDeaf.setUnreadAmount(unread);

      emit(NotificationsResult(_notifications));
    });

    on<ReadNotification>((event, emit) async {
      await postReadNotification(event.notificationID);
      add(FetchNotifications());
    });
  }
}

List<DTONotification> _notifications = [];
