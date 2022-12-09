part of 'activity_detail_bloc.dart';

abstract class ActivityDetailState extends Equatable {
  const ActivityDetailState();
  
  @override
  List<Object> get props => [];
}

class ActivityDetailInitial extends ActivityDetailState {}
