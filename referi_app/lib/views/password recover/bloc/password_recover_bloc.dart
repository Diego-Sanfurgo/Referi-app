import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:referi_app/API/auth/post_auth_recover.dart';
import 'package:referi_app/controllers/alert_controller.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

part 'password_recover_event.dart';
part 'password_recover_state.dart';

class PasswordRecoverBloc
    extends Bloc<PasswordRecoverEvent, PasswordRecoverState> {
  PasswordRecoverBloc() : super(PasswordRecoverInitial()) {
    on<SendRecoveryEmail>((event, emit) async {
      if (!event.formKey.currentState!.validate()) {
        return;
      }
      event.formKey.currentState!.save();

      bool isOk = await postAuthRecover(event.email);

      if (!isOk) {
        await Alert.showError(
            "Ocurrió un error al enviar la contraseña al correo electrónico. Intenta nuevamente.");
        return;
      }

      Alert.showToast("Enviamos una nueva contraseña al email ingresado.");
      // NavigationController.goTo(Routes.signup_3);
      NavigationController.pop();
    });
  }
}
