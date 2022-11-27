import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'activity_search_event.dart';
part 'activity_search_state.dart';

class ActivitySearchBloc extends Bloc<ActivitySearchEvent, ActivitySearchState> {
  ActivitySearchBloc() : super(ActivitySearchInitial()) {
    on<ActivitySearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
