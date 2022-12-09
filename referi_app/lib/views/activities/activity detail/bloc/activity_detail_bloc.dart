import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'activity_detail_event.dart';
part 'activity_detail_state.dart';

class ActivityDetailBloc extends Bloc<ActivityDetailEvent, ActivityDetailState> {
  ActivityDetailBloc() : super(ActivityDetailInitial()) {
    on<ActivityDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
