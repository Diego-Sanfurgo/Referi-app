import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:referi_app/API/notifications/get_user_notifications.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitial()) {
    on<FetchNotifications>((event, emit) async {
      List? notifications = await getUserNotifications();
      if (notifications == null) {
        emit(NoNotificationsFound());
        return;
      }

      emit(NotificationsResult(notifications));
    });
  }
}
