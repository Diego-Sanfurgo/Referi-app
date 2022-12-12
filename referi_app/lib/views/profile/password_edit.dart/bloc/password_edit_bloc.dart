import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_edit_event.dart';
part 'password_edit_state.dart';

class PasswordEditBloc extends Bloc<PasswordEditEvent, PasswordEditState> {
  PasswordEditBloc() : super(PasswordEditInitial()) {
    on<PasswordEditEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
