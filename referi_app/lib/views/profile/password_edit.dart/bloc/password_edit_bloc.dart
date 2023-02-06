import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:referi_app/API/auth/post_change_password.dart';
import 'package:referi_app/controllers/general_alert_controller.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

part 'password_edit_event.dart';
part 'password_edit_state.dart';

class PasswordEditBloc extends Bloc<PasswordEditEvent, PasswordEditState> {
  PasswordEditBloc() : super(PasswordEditInitial()) {
    on<SubmitChangePassword>((event, emit) async {
      bool isOk =
          await postChangePassword(event.oldPassword, event.newPassword);

      if (!isOk) {
        emit(PasswordEditError());
        return;
      }

      GeneralAlert.showToast("¡Se cambió la contraseña exitosamente!");
      NavigationController.pop();
    });
  }
}
