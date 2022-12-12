part of 'notifications_bloc.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class NotificationsResult extends NotificationsState {
  final List notifications;

  const NotificationsResult(this.notifications);
}

class NoNotificationsFound extends NotificationsState {}
