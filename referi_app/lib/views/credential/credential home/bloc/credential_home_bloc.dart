import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'credential_home_event.dart';
part 'credential_home_state.dart';

class CredentialHomeBloc extends Bloc<CredentialHomeEvent, CredentialHomeState> {
  CredentialHomeBloc() : super(CredentialHomeInitial()) {
    on<CredentialHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
