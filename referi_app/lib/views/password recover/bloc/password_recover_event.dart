part of 'password_recover_bloc.dart';

abstract class PasswordRecoverEvent extends Equatable {
  const PasswordRecoverEvent();

  @override
  List<Object> get props => [];
}

class SendRecoveryEmail extends PasswordRecoverEvent {
  final String email;
  final GlobalKey<FormState> formKey;

  const SendRecoveryEmail(this.email, this.formKey);
}
