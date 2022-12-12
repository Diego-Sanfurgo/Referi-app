part of 'notifications_bloc.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class NotificationsResult extends NotificationsState {
  final List<DTONotification> notifications;

  const NotificationsResult(this.notifications);
}

class NoNotificationsFound extends NotificationsState {}

class IconNotificationClean extends NotificationsState {}

class IconNotificationResults extends NotificationsState {
  final String amount;

  const IconNotificationResults(this.amount);
}
