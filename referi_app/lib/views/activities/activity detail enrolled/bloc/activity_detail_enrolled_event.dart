part of 'activity_detail_enrolled_bloc.dart';

abstract class ActivityDetailEnrolledEvent extends Equatable {
  const ActivityDetailEnrolledEvent();

  @override
  List<Object> get props => [];
}

class CancelInscriptionEvent extends ActivityDetailEnrolledEvent {
  final Enrollment enrollment;

  const CancelInscriptionEvent(this.enrollment);
}

class LoadStatusEvent extends ActivityDetailEnrolledEvent {
  final Enrollment enrollment;

  const LoadStatusEvent(this.enrollment);
}
