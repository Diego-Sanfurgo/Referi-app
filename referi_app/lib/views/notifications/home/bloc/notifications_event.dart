part of 'notifications_bloc.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object> get props => [];
}

class FetchNotifications extends NotificationsEvent {}

class ClearIconNotifications extends NotificationsEvent {}

class FetchIconNotifications extends NotificationsEvent {}