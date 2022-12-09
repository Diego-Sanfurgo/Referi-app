import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '/models/activity.dart';
import '/models/organization.dart';
import '/models/dto/activity_dto.dart';
import '/models/dto/organization_dto.dart';
import '/API/activity/get_activities_by_org.dart';

part 'club_detail_event.dart';
part 'club_detail_state.dart';

class ClubDetailBloc extends Bloc<ClubDetailEvent, ClubDetailState> {
  ClubDetailBloc() : super(ClubDetailInitial()) {
    on<FetchClubActivities>((event, emit) async {
      _activitiesSearched = await getActivityiesByOrg(event.org.id);
      if (_activitiesSearched == null) {
        return;
      }
      List<DTOActivity> auxList = [];
      for (var dtoActivity in _activitiesSearched!) {
        dtoActivity.organizacion = DTOOrganization.fromJson(event.org.toJson());
        auxList.add(dtoActivity);
      }

      emit(ActivitiesResult(_activitiesSearched!));
    });
  }
}

List<DTOActivity>? _activitiesSearched = [];
