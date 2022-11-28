import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../handlers/activity_handler.dart';
import '../../../../models/activity.dart';

part 'activity_search_event.dart';
part 'activity_search_state.dart';

class ActivitySearchBloc
    extends Bloc<ActivitySearchEvent, ActivitySearchState> {
  ActivitySearchBloc() : super(ActivitySearchInitial()) {
    on<ToInitial>((event, emit) => emit(ActivitySearchInitial()));

    on<FilterList>((event, emit) {
      List<Activity> filteredList = _activitiesSearched.where((activity) {
        String activityName = activity.nombre.toLowerCase();
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
      event.activityId;
      List<Activity>? activitiesSearched =
          await ActivityHandler.obtainActivitiesByType(event.activityId);
      if (activitiesSearched == null) {
        emit(ActivitySearchNotFound());
        return;
      }

      _activitiesSearched = activitiesSearched;
      emit(ActivitySearchResults(activitiesSearched, isSearching: false));
    });
  }
}

List<Activity> _activitiesSearched = [];
