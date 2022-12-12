import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/models/dto/notification_dto.dart';
import '/API/notifications/get_user_notifications.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitial()) {
    on<FetchNotifications>((event, emit) async {
      List<DTONotification>? notifications = await getUserNotifications();
      if (notifications == null) {
        emit(NoNotificationsFound());
        return;
      }

      emit(NotificationsResult(notifications));
    });

    on<FetchIconNotifications>((event, emit) async {
      List<DTONotification>? notifications = await getUserNotifications();
      if (notifications == null) {
        emit(IconNotificationClean());
        return;
      }

      emit(IconNotificationResults(notifications.length.toString()));
    });

    on<ClearIconNotifications>((event, emit) => emit(IconNotificationClean()));
  }
}
