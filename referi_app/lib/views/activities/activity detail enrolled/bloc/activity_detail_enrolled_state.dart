part of 'activity_detail_enrolled_bloc.dart';

abstract class ActivityDetailEnrolledState extends Equatable {
  const ActivityDetailEnrolledState();

  @override
  List<Object> get props => [];
}

class ActivityDetailEnrolledInitial extends ActivityDetailEnrolledState {}

class FailedToLoadStatus extends ActivityDetailEnrolledState {}

class ActivityStatusLoaded extends ActivityDetailEnrolledState {
  final Map<String, String> statusData;

  const ActivityStatusLoaded(this.statusData);
}
