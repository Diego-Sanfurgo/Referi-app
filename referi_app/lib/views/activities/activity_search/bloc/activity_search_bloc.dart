import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '/models/dto/activity_dto.dart';
import '/API/activity/get_activities_by_type.dart';

part 'activity_search_event.dart';
part 'activity_search_state.dart';

class ActivitySearchBloc
    extends Bloc<ActivitySearchEvent, ActivitySearchState> {
  ActivitySearchBloc() : super(ActivitySearchInitial()) {
    on<ToInitial>((event, emit) => emit(ActivitySearchInitial()));

    on<FilterList>((event, emit) {
      List<DTOActivity> filteredList = _activitiesSearched.where((activity) {
        String activityName = activity.nombre!.toLowerCase();
        String query = event.query.toLowerCase().trim();
        return activityName.contains(query);
      }).toList();
      emit(ActivitySearchResults(filteredList, isSearching: true));
    });

    on<SwitchAppbar>((event, emit) {
      if (event.isSearching) {
        emit(SwitchedAppbarState(event.isSearching));
      } else {
        emit(ActivitySearchInitial());
      }
    });

    on<ObtainActivitiesByType>((event, emit) async {
      List<DTOActivity>? activitiesSearched =
          await getActivitiesByType(event.activityId);
      if (activitiesSearched == null) {
        emit(ActivitySearchNotFound());
        return;
      }

      _activitiesSearched = activitiesSearched;
      emit(ActivitySearchResults(activitiesSearched, isSearching: false));
    });
  }
}

List<DTOActivity> _activitiesSearched = [];
