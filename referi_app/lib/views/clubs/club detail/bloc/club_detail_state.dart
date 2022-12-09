part of 'club_detail_bloc.dart';

abstract class ClubDetailState extends Equatable {
  const ClubDetailState();

  @override
  List<Object> get props => [];
}

class ClubDetailInitial extends ClubDetailState {}

class ActivitiesNotFound extends ClubDetailState {}

class ActivitiesResult extends ClubDetailState {
  final List<DTOActivity> list;

  const ActivitiesResult(this.list);
}
