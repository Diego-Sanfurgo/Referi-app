part of 'club_detail_bloc.dart';

abstract class ClubDetailEvent extends Equatable {
  const ClubDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchClubActivities extends ClubDetailEvent {
  // final String orgId;
  final DTOOrganization org;

  const FetchClubActivities(this.org);
}
